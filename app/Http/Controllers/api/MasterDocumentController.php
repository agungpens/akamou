<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\MasterDocument;
use App\Models\MasterTemplateDoc;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Storage;
use PhpOffice\PhpWord\IOFactory;


class MasterDocumentController extends Controller
{
    public function getTableName()
    {
        return "master_document";
    }

    public function getData()
    {

        DB::enableQueryLog();
        $data['data'] = [];
        $data['recordsTotal'] = 0;
        $data['recordsFiltered'] = 0;
        $datadb = DB::table($this->getTableName() . ' as m')
            ->leftJoin('master_template_doc as mt', 'mt.id', '=', 'm.master_template_id')
            ->orderBy('m.id')
            ->select([
                'm.*',
                'mt.nama_template'
            ]);

        // dd($datadb->get());
        if (isset($_GET)) {
            $data['recordsTotal'] = $datadb->get()->count();
            if (isset($_GET['search']['value'])) {
                $keyword = $_GET['search']['value'];
                $datadb->where(function ($query) use ($keyword) {
                    $query->where('mt.nama_template', 'LIKE', '%' . $keyword . '%');
                });
            }
            if (isset($_GET['order'][0]['column'])) {
                $datadb->orderBy('m.id', $_GET['order'][0]['dir']);
            }
            $data['recordsFiltered'] = $datadb->get()->count();

            if (isset($_GET['length'])) {
                $datadb->limit($_GET['length']);
            }
            if (isset($_GET['start'])) {
                $datadb->offset($_GET['start']);
            }
        }
        $data['data'] = $datadb->get()->toArray();
        // dd($data['data']);
        $data['draw'] = $_GET['draw'];
        $query = DB::getQueryLog();

        return response()->json($data);
    }


    public function getDetailData($id)
    {
        DB::enableQueryLog();
        $datadb = DB::table($this->getTableName() . ' as m')
            ->leftJoin('master_template_doc as mt', 'mt.id', '=', 'm.master_template_id')
            ->orderBy('m.id')
            ->select([
                'm.*',
                'mt.nama_template'
            ])->where('m.id', $id);
        $data = $datadb->first();
        $query = DB::getQueryLog();
        return response()->json($data);
    }

    public function submit(Request $request)
    {
        $data = $request->post();
        dd($data);
        // begin transaction
        DB::beginTransaction();
        try {

            $data_template = MasterTemplateDoc::find($data['data']['template_id']);
            $nama_file = $data_template->file;
            $dokumen_path = $data_template->dokumen_path;
            $filePath = public_path($dokumen_path);
            $phpWord = IOFactory::load($filePath);
            if (file_exists($filePath)) {
                // penamaan file
                $newFilePath = public_path('file/' . $data['data']['tentang'] .'.docx');
                // jika ada file yang sama / maka hapus dan ganti file yang baru
                if (file_exists($newFilePath)) {
                    unlink($newFilePath);
                }


                // Creating the new document...
                $phpWord = new \PhpOffice\PhpWord\TemplateProcessor($filePath);
                // set Values
                $phpWord->setValues([
                    'nomor' => $data['data']['nomor'],
                    'nama_instansi' => 'Polinema Malang',
                    'tanggal' => $data['data']['tanggal'],
                    'tempat' => $data['data']['tempat'],
                    'tentang' => $data['data']['tentang'],
                    'nama_penanda_tangan' => $data['data']['nama_penanda_tangan'],
                    'jabatan' => $data['data']['jabatan'],
                    'jabatan_penanda_tangan' => $data['data']['jabatan_penanda_tangan'],
                    'nama' => $data['data']['nama'],
                    'alamat_instansi' => $data['data']['alamat_instansi'],
                ]);
                // Saving the document
                $phpWord->saveAs($newFilePath);

            } else {
                abort(404);
            }

            $push = $data['data']['id'] == '' ? new MasterDocument() : MasterDocument::find($data['data']['id']);
            $push->id = $data['data']['id'];
            $push->master_template_id = $data['data']['template_id'];
            $push->nomor = $data['data']['nomor'];
            $push->tanggal = $data['data']['tanggal'];
            $push->tempat = $data['data']['tempat'];
            $push->tentang = $data['data']['tentang'];
            $push->nama_penanda_tangan = $data['data']['nama_penanda_tangan'];
            $push->jabatan = $data['data']['jabatan'];
            $push->jabatan_penanda_tangan = $data['data']['jabatan_penanda_tangan'];
            $push->nama = $data['data']['nama'];
            $push->nama_instansi = 'Polinema Malang';
            $push->alamat_instansi = $data['data']['alamat_instansi'];
            $push->file_path= 'file/'. $data['data']['tentang'].'.docx';
            $push->file= $data['data']['tentang'] . '.docx';

            $push->save();
            // commit
            DB::commit();
            $result['is_valid'] = true;
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
            $push = MasterDocument::find($data['id']);
            // jika ada maka ambil data dokumen_doc
            $fileToDelete = 'file/'.$push->file;


            $filePath = public_path($fileToDelete);
            unlink($filePath);

            $push->delete();

            DB::commit();
            $result['is_valid'] = true;
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
            $path = $file->store('berkas', ['disk' => 'my_files']);
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
