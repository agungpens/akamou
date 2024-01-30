<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\DokumenMoa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class DokumenMoaController extends Controller
{
    public function getTableName()
    {
        return "dokumen_moa";
    }

    public function getData()
    {

        DB::enableQueryLog();
        $data['data'] = [];
        $data['recordsTotal'] = 0;
        $data['recordsFiltered'] = 0;
        $datadb =  DokumenMoa::with(['LevelDocMoa', 'RelevansiProdiMoa', 'KategoriMoa', 'JenisMoa', 'doc_mou']);

        // dd($datadb->get());
        if (isset($_POST)) {
            $data['recordsTotal'] = $datadb->get()->count();
            if (isset($_POST['search']['value'])) {
                $keyword = $_POST['search']['value'];
                $datadb->where(function ($query) use ($keyword) {
                    $query->where('nomor_mou', 'LIKE', '%' . $keyword . '%');
                    $query->Orwhere('status', 'LIKE', '%' . $keyword . '%');
                });
            }

            if (isset($_POST['status'])) {
                if ($_POST['status'] != '') {
                    $datadb->where('status', '=', $_POST['status']);
                }
            }





            if (isset($_POST['prodi'])) {
                if ($_POST['prodi'] != '') {
                    $datadb->where('relevansi_prodi', '=', $_POST['prodi']);
                }
            }
            if (isset($_POST['level'])) {
                if ($_POST['level'] != '') {
                    $datadb->where('level_moa', '=', $_POST['level']);
                }
            }
            if (isset($_POST['kategori'])) {
                if ($_POST['kategori'] != '') {
                    $datadb->where('kategori_moa', '=', $_POST['kategori']);
                }
            }

            if (isset($_POST['tanggal_dibuat'])) {
                if ($_POST['tanggal_dibuat'] != '') {
                    $datadb->where('tanggal_dibuat', '=', $_POST['tanggal_dibuat']);
                }
            }
            if (isset($_POST['tanggal_berakhir'])) {
                if ($_POST['tanggal_berakhir'] != '') {
                    $datadb->where('tanggal_berakhir', '=', $_POST['tanggal_berakhir']);
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
        $datadb = DokumenMoa::with(['LevelDocMoa', 'KategoriMoa', 'JenisMoa', 'doc_mou'])->where('id', $id);
        $data = $datadb->first();
        $query = DB::getQueryLog();
        return response()->json($data);
    }

    public function submit(Request $request)
    {
        $data = $request->post();
        $data_record = array();
        $nomor_mou = null;

        // begin transaction
        DB::beginTransaction();
        try {
            if (isset($data['data']['nomor_mou'])) {
                $nomor_mou = explode(' - ', $data['data']['nomor_mou']);
                $nomor_mou = $nomor_mou[0];
            }

            foreach ($data['data_moa'] as $key => $value) {

                $kategori_doc = explode(' - ', $value['kategori_doc']);
                $level_doc = explode(' - ', $value['level_doc']);
                $jenis_doc = explode(' - ', $value['jenis_doc']);
                $relevansi_prodi = explode(' - ', $value['relevansi_prodi']);

                $imageName = null;
                $dbpathlamp = null;

                if (isset($value['file'])) {
                    if (isset($value['id'])) {
                        $cek_file = DokumenMoa::find($value['id']);
                        $oldFilePath = public_path() . '/' . $cek_file->file_path . $cek_file->file_moa;
                        // Delete the old file
                        if (File::exists($oldFilePath)) {
                            unlink($oldFilePath);
                        }
                    }

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
                    $dir = 'file/';

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

                $data_record[] = [
                    'id' => $value['id'],
                    'nomor_mou' => $data['data']['nomor_mou'],
                    'nomor_moa' => $value['nomor_moa'],
                    'tanggal_dibuat' => $value['tanggal_dibuat'],
                    'tanggal_berakhir' => $value['tanggal_berakhir'],
                    'status' => $value['status_doc'],
                    'kerja_sama_dengan' => $value['kerja_sama_dengan'],

                    'jenis_doc' => $value['jenis_doc'],
                    'kategori_moa' => $value['kategori_doc'],
                    'level_moa' => $value['level_doc'],
                    'relevansi_prodi' => $value['relevansi_prodi'],

                    'file_moa' => $imageName,
                    'file_path' => $dbpathlamp,

                ];


                $push = $value['id'] == '' ? new DokumenMoa() :  DokumenMoa::find($value['id']);

                $push->id = $value['id'];
                $push->nomor_mou = $nomor_mou;
                $push->nomor_moa = $value['nomor_moa'];
                $push->tanggal_dibuat = $value['tanggal_dibuat'];
                $push->tanggal_berakhir = $value['tanggal_berakhir'];
                $push->status = $value['status_doc'];
                $push->kerja_sama_dengan = $value['kerja_sama_dengan'];

                $push->jenis_doc = $jenis_doc[0];
                $push->kategori_moa = $kategori_doc[0];
                $push->level_moa = $level_doc[0];
                $push->relevansi_prodi = $relevansi_prodi[0];

                if (isset($value['file'])) {
                    $push->file_moa = $imageName;
                    $push->file_path = $dbpathlamp;
                }

                $push->save();
            }

            // dd($data_record);
            DB::commit();
            $result['is_valid'] = true;
            createLog($data_record, $data['user_id'], 'TAMBAH DOKUMEN MOA');
        } catch (\Throwable $th) {
            $result['message'] = $th->getMessage();
            DB::rollBack();
        }

        return response()->json($result);
    }
    public function updated(Request $request)
    {
        $data = $request->post();
        $data_record = array();
        $nomor_mou = null;

        // begin transaction
        DB::beginTransaction();
        try {
            if (isset($data['data']['nomor_mou'])) {
                $nomor_mou = explode(' - ', $data['data']['nomor_mou']);
                $nomor_mou = $nomor_mou[0];
            }

            $push = DokumenMoa::find($data['data']['id']);
            $push->id = $data['data']['id'];
            $push->nomor_mou = $nomor_mou;
            $push->nomor_moa = $data['data']['nomor_moa'];
            $push->tanggal_dibuat = $data['data']['tanggal_dibuat'];
            $push->tanggal_berakhir = $data['data']['tanggal_berakhir'];
            $push->status = $data['data']['status'];
            $push->kerja_sama_dengan = $data['data']['kerja_sama_dengan'];

            $push->jenis_doc = $data['data']['jenis'];
            $push->kategori_moa = $data['data']['kategori'];
            $push->level_moa = $data['data']['level'];
            $push->relevansi_prodi = $data['data']['relevansi_prodi'];

            if (isset($data['data']['file'])) {
                // Old file path
                $oldFilePath = public_path() . '/' . $push->file_path . $push->file_moa;

                // Generate a new file name
                $string = "abcdefghijklmnopqrstuvwxyz123456789";
                $saveName = str_shuffle($string) . '.' . $data['data']['tipe'];
                $imageName = $saveName;

                // New file directory
                $dir = 'file/';
                $dir .= date('Y') . '/' . date('m');
                $pathlamp = public_path() . '/' . $dir . '/';

                // Create the directory if it doesn't exist
                if (!File::isDirectory($pathlamp)) {
                    File::makeDirectory($pathlamp, 0777, true, true);
                }

                // Delete the old file
                if (File::exists($oldFilePath)) {
                    unlink($oldFilePath);
                }

                // Save the new file
                if ($data['data']['tipe'] == 'pdf') {
                    uploadFileFromBlobString($pathlamp, $imageName, $data['data']['file']);
                } else {
                    File::put($pathlamp . $imageName, base64_decode($data['data']['file']));
                }

                // Update the database path
                $dbpathlamp = '/' . $dir . '/';
            }


            $push->file_moa = isset($imageName) ? $imageName : $push->file_moa;
            $push->file_path = isset($dbpathlamp) ? $dbpathlamp : $push->file_path;

            $push->save();

            $data_record = [
                'id' => $data['data']['id'],
                'nomor_mou' => $nomor_mou,
                'nomor_moa' => $data['data']['nomor_moa'],
                'tanggal_dibuat' => $data['data']['tanggal_dibuat'],
                'tanggal_berakhir' => $data['data']['tanggal_berakhir'],
                'status' => $data['data']['status'],
                'kerja_sama_dengan' => $data['data']['kerja_sama_dengan'],

                'jenis_doc' => $data['data']['jenis'],
                'kategori_moa' => $data['data']['kategori'],
                'level_moa' => $data['data']['level'],
                'relevansi_prodi' => $data['data']['relevansi_prodi'],

                'file_moa' =>  isset($imageName) ? $imageName : "",
                'file_path' => isset($dbpathlamp) ?  $dbpathlamp : "",

            ];
            // dd($data_record);
            DB::commit();
            $result['is_valid'] = true;
            createLog($data_record, $data['user_id'], 'UPDATE DOKUMEN MOA');
        } catch (\Throwable $th) {
            $result['message'] = $th->getMessage();
            DB::rollBack();
        }

        return response()->json($result);
    }


    public function delete(Request $request)
    {

        $data = $request->post();
        // dd($data);

        $result['is_valid'] = false;
        DB::beginTransaction();
        try {
            $push = DokumenMoa::find($data['id']);

            if (isset($push->file_moa)) {

                $oldFilePath = public_path() . '/' . $push->file_path . $push->file_moa;

                // Delete the old file
                if (File::exists($oldFilePath)) {
                    unlink($oldFilePath);
                }
            }

            $push->delete();

            DB::commit();
            $result['is_valid'] = true;
            createLog($data, $data['user_id'], 'DELETE DOKUMEN MOA');
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
        return view('page.mou.dokumen_moa.data_template', $data);
    }
    public function showDataKategori(Request $request)
    {
        $data = $request->all();
        return view('page.mou.dokumen_moa.data_kategori', $data);
    }
    public function showDataLevel(Request $request)
    {
        $data = $request->all();
        return view('page.mou.dokumen_moa.data_level', $data);
    }
    public function showDataProdi(Request $request)
    {
        $data = $request->all();
        return view('page.mou.dokumen_moa.data_prodi', $data);
    }

    public function getDataMoa(Request $request)
    {
        $datadb =  DokumenMoa::with(['LevelDocMoa', 'RelevansiProdiMoa', 'KategoriMoa', 'JenisMoa', 'doc_mou'])->where('nomor_mou', $request->nomor_mou);

        $data = [
            'nomor_mou' => $request->nomor_mou,
            'data' =>  $datadb->get()->toArray()
        ];
        return response()->json($data);
    }
}
