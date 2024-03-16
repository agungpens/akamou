<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\Kegiatan;
use App\Models\LampiranKegiatan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

use function PHPUnit\Framework\isNan;

class KegiatanController extends Controller
{
    public function getTableName()
    {
        return "kegiatan";
    }

    public function getData()
    {

        DB::enableQueryLog();
        $data['data'] = [];
        $data['recordsTotal'] = 0;
        $data['recordsFiltered'] = 0;
        $datadb =  Kegiatan::with(['NomorDocMou', 'NomorDocMoa', 'Lampiran']);

        // dd($datadb->get());
        if (isset($_POST)) {
            $data['recordsTotal'] = $datadb->get()->count();
            if (isset($_POST['search']['value'])) {
                $keyword = $_POST['search']['value'];
                $datadb->where(function ($query) use ($keyword) {
                    $query->where('nomor_mou', 'LIKE', '%' . $keyword . '%');
                    // $query->Orwhere('status', 'LIKE', '%' . $keyword . '%');
                });
            }


            if (isset($_POST['prodi'])) {
                if ($_POST['prodi'] != '') {
                    $datadb->where('relevansi_prodi', '=', $_POST['prodi']);
                }
            }


            if (isset($_POST['order'][0]['column'])) {
                $datadb->orderBy('id', $_POST['order'][0]['dir']);
            }
            $data['recordsFiltered'] = $datadb->get()->count();

            if (isset($_POST['length'])) {
                $datadb->limit($_POST['length']);
            }
            if (isset($_POST['start'])) {
                $datadb->offset($_POST['start']);
            }
        }
        $data['data'] = $datadb->get()->toArray();
        // dd($data['data']);
        $data['draw'] = $_POST['draw'];
        $query = DB::getQueryLog();

        return response()->json($data);
    }


    public function getDetailData($id)
    {
        DB::enableQueryLog();
        $datadb = Kegiatan::with(['NomorDocMou', 'NomorDocMoa', 'Lampiran'])->where('id', $id);
        $data = $datadb->first()->toArray();
        $query = DB::getQueryLog();
        return response()->json($data);
    }

    public function submit(Request $request)
    {
        $data = $request->post();

        $data_record = array();
        $nomor_moa = null;
        $nomor_mou = null;

        if ($data['data']['nomor_mou'] == null && $data['data']['nomor_moa'] == null) {
            return response()->json([
                'status' => 422,
                'message' => 'Data Nomor MOU / MOA Tidak boleh kosong , isi salah satu saja!',

            ]);
        }
        if (!isset($data['data_lampiran']) ) {
            return response()->json([
                'status' => 422,
                'message' => 'Lampiran Belum Anda Isi!',

            ]);
        }

        // begin transaction
        DB::beginTransaction();
        try {
            if (isset($data['data']['nomor_mou'])) {
                $nomor_mou = explode(' - ', $data['data']['nomor_mou']);
                $nomor_mou = $nomor_mou[0];
            }
            if (isset($data['data']['nomor_moa'])) {
                $nomor_moa = explode(' - ', $data['data']['nomor_moa']);
                $nomor_moa = $nomor_moa[0];
            }

            $push = $data['data']['id'] == '' ? new Kegiatan() :  Kegiatan::find($data['data']['id']);

            $push->id = $data['data']['id'];
            $push->nomor_mou = $nomor_mou;
            $push->nomor_moa = $nomor_moa;
            $push->kegiatan = $data['data']['kegiatan'];
            $push->save();
            $data_record[] = [
                'id' => $data['data']['id'],
                'nomor_mou' => $data['data']['nomor_mou'],
                'nomor_moa' => $data['data']['nomor_moa'],
                'kegiatan' => $data['data']['kegiatan'],
            ];
            if (isset($data['data_lampiran'])) {
                foreach ($data['data_lampiran'] as $key => $value) {
                    $imageName = null;
                    $dbpathlamp = null;

                    if ($value['id'] != null && isset($value['file'])) {
                        $cek_file = LampiranKegiatan::find($value['id']);
                        $oldFilePath = public_path() . '/' . $cek_file->file_path . $cek_file->file;
                        // Delete the old file
                        if (File::exists($oldFilePath)) {
                            unlink($oldFilePath);
                        }
                    }

                    if (isset($value['file'])) {
                        $image = $value['file'];

                        $string = "abcdefghijklmnopqrstuvwxyz123456789";
                        $saveName = str_shuffle($string) . '.' . $value['tipe'];

                        $image = str_replace('data:image/png;base64,', '', $image);
                        $image = str_replace('data:image/jpeg;base64,', '', $image);
                        $image = str_replace('data:image/jpg;base64,', '', $image);
                        $image = str_replace('data:image/pdf;base64,', '', $image);
                        $image = str_replace(' ', '+', $image);
                        $imageName = $saveName;
                        // $path = public_path() . '/pengajuan_pre_pr/';
                        $dir = 'lampiran/';

                        $dir .= date('Y') . '/' . date('m');

                        $pathlamp = public_path() . '/' . $dir . '/';

                        if (!File::isDirectory($pathlamp)) {
                            File::makeDirectory($pathlamp, 0777, true, true);
                        }

                        if ($value['file'] != '') {
                            if ($value['tipe'] == 'pdf') {
                                uploadFileFromBlobString($pathlamp, $imageName, $image);
                            } else {
                                File::put($pathlamp . $imageName, base64_decode($image));
                            }
                        }

                        $dbpathlamp = '/' . $dir . '/';
                    }


                    $push_lampiran = $value['id'] == null ?  new LampiranKegiatan() : LampiranKegiatan::find($value['id']);
                    $push_lampiran->kegiatan_id = $push->id;
                    if ($value['id'] == null || isset($value['file'])) {
                        $push_lampiran->file = $imageName;
                        $push_lampiran->file_path = $dbpathlamp;
                    }
                    $push_lampiran->keterangan = $value['keterangan'];
                    $push_lampiran->save();
                }
            }


            // dd($data_record);
            DB::commit();
            $result['is_valid'] = true;
            createLog($data_record, $data['user_id'], 'TAMBAH KEGIATAN');
        } catch (\Throwable $th) {
            $result['message'] = $th->getMessage();
            DB::rollBack();
        }

        return response()->json($result);
    }


    public function delete(Request $request)
    {
        $data = $request->post();
        $result['is_valid'] = false;

        DB::beginTransaction();

        try {
            $push = Kegiatan::find($data['id']);
            $push_lampiran = LampiranKegiatan::where('kegiatan_id', $data['id'])->get();

            foreach ($push_lampiran as $lampiran) {
                $oldFilePath = public_path() . '/' . $lampiran->file_path . $lampiran->file;

                // Delete the old file
                if (File::exists($oldFilePath)) {
                    unlink($oldFilePath);
                }

                // Delete the record
                $lampiran->delete();
            }

            $push->delete();

            DB::commit();
            $result['is_valid'] = true;
            createLog($data, $data['user_id'], 'DELETE KEGIATAN DAN LAMPIRANYA');
        } catch (\Throwable $th) {
            $result['message'] = $th->getMessage();
            DB::rollBack();
        }

        return response()->json($result);
    }

    public function deleteDataLampiran(Request $request)
    {

        $data = $request->post();
        // dd($data);

        $result['is_valid'] = false;
        DB::beginTransaction();
        try {
            $push = LampiranKegiatan::find($data['id']);

            if (isset($push->file)) {

                $oldFilePath = public_path() . '/' . $push->file_path . $push->file;

                // Delete the old file
                if (File::exists($oldFilePath)) {
                    unlink($oldFilePath);
                }
            }

            $push->delete();

            DB::commit();
            $result['is_valid'] = true;
            createLog($data, $data['user_id'], 'DELETE LAMPIRAN KEGIATAN');
        } catch (\Throwable $th) {
            $result['message'] = $th->getMessage();
            DB::rollBack();
        }

        return response()->json($result);
    }
    public function execUploadFile(Request $request)
    {
        $file = $request->file('file');
        // echo '<pre>';
        // print_r($file);die;
        $result['is_valid'] = false;
        $this->validate($request, [
            'file' => 'required|file|max:100000',
        ]);
        if ($request->hasFile('file')) {
            $path = $file->store('file', ['disk' => 'my_files']);
            $result['is_valid'] = true;
            $result['path'] = $path;
        } else {
            $result['message'] = 'Data Gagal Diupload';
        }
        return response()->json($result);
    }

    public function showDataMou(Request $request)
    {
        $data = $request->all();
        return view('page.mou.kegiatan.data_mou', $data);
    }
    public function showDataMoa(Request $request)
    {
        $data = $request->all();
        return view('page.mou.kegiatan.data_moa', $data);
    }
}
