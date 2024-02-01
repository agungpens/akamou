<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\DokumenMou;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Storage;
use PhpOffice\PhpWord\IOFactory;


class DokumenMouController extends Controller
{
    public function getTableName()
    {
        return "dokumen_mou";
    }

    public function getData()
    {

        DB::enableQueryLog();
        $data['data'] = [];
        $data['recordsTotal'] = 0;
        $data['recordsFiltered'] = 0;
        $datadb =  DokumenMou::with(['LevelDocMou', 'KategoriMou', 'JenisMou', 'RelevansiProdiMou']);

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
            if (isset($_POST['order'][0]['column'])) {
                $datadb->orderBy('id', $_POST['order'][0]['dir']);
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
        $datadb = DokumenMou::with(['LevelDocMou', 'KategoriMou', 'JenisMou', 'RelevansiProdiMou'])->where('id', $id);
        $data = $datadb->first();
        $query = DB::getQueryLog();
        return response()->json($data);
    }

    public function submit(Request $request)
    {
        $data = $request->post();
        // begin transaction
        DB::beginTransaction();
        try {

            $push = $data['data']['id'] == '' ? new DokumenMou() : DokumenMou::find($data['data']['id']);
            $push->id = $data['data']['id'];
            $push->nomor_mou = $data['data']['nomor_mou'];
            $push->tanggal_dibuat = $data['data']['tanggal_dibuat'];
            $push->tanggal_berakhir = $data['data']['tanggal_berakhir'];
            $push->jenis_doc = $data['data']['jenis'];
            $push->kategori_mou     = $data['data']['kategori'];
            $push->level_mou = $data['data']['level'];
            $push->status = $data['data']['status'];
            $push->kerja_sama_dengan = $data['data']['kerja_sama_dengan'];

            if (isset($data['data']['file'])) {
                // Old file path
                $oldFilePath = public_path() . '/' . $push->file_path . $push->file_mou;

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

                if (isset($push->file_mou)) {
                    // Delete the old file
                    if (File::exists($oldFilePath)) {
                        unlink($oldFilePath);
                    }
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

            $push->file_mou = isset($imageName) ? $imageName : $push->file_mou;
            $push->file_path = isset($dbpathlamp) ? $dbpathlamp : $push->file_path;


            $push->save();
            // commit
            $data_record = [
                'id' => $data['data']['id'],
                'nomor_mou' => $data['data']['nomor_mou'],
                'tanggal_dibuat' => $data['data']['tanggal_dibuat'],
                'tanggal_berakhir' => $data['data']['tanggal_berakhir'],
                'status' => $data['data']['status'],
                'kerja_sama_dengan' => $data['data']['kerja_sama_dengan'],

                'jenis_doc' => $data['data']['jenis'],
                'kategori_moa' => $data['data']['kategori'],
                'level_moa' => $data['data']['level'],
                'relevansi_prodi' => $data['data']['relevansi_prodi'],

                'file_mou' =>  isset($imageName) ? $imageName : "",
                'file_path' => isset($dbpathlamp) ?  $dbpathlamp : "",

            ];
            DB::commit();
            $result['is_valid'] = true;

            $data['data']['id'] == '' ? createLog($data_record, $data['user_id'], 'TAMBAH MASTER DOCUMENT') : createLog($data, $data['user_id'], 'UPDATE MASTER DOCUMENT');
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
            $push = DokumenMou::find($data['id']);

            // jika ada maka ambil data dokumen_doc
            $fileToDelete = $push->file_path;


            $filePath = public_path($fileToDelete);
            unlink($filePath);

            $push->delete();

            DB::commit();
            $result['is_valid'] = true;
            createLog($data, $data['user_id'], 'DELETE MASTER DOCUMENT');
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

    public function showDataTemplate(Request $request)
    {
        $data = $request->all();
        return view('page.mou.master_document.data_template', $data);
    }
}
