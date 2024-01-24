<?php

namespace App\Http\Controllers\web;

use App\Http\Controllers\Controller;
use App\Http\Controllers\api\MasterDocumentController as ApiMasterDocumentController;
use App\Models\MasterTemplateDoc;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MasterDocumentController extends Controller
{
    public function getTitleParent()
    {
        return "Data MOU";
    }

    public function getJs()
    {
        return asset('assets/js/controller/mou/master_document.js');
    }

    public function index()
    {
        $data['data'] = [];
        $view = view('page.mou.master_document.index', $data);
        $put['title_content'] = 'Master Document';
        $put['title_top'] = 'Master Document';
        $put['title_parent'] = $this->getTitleParent();
        $put['js'] = $this->getJs();
        $put['view_file'] = $view;

        return view('template.main', $put);
    }


    public function add()
    {
        $api = new MasterTemplateDoc();
        $data['data'] = [];
        $data['list_jenis'] = $api->get();
        $view = view('page.mou.master_document.form.formadd', $data);
        $put['title_content'] = 'Tambah Document';
        $put['title_top'] = 'Tambah Document';
        $put['title_parent'] = $this->getTitleParent();
        $put['js'] = $this->getJs();
        $put['view_file'] = $view;

        return view('template.main', $put);
    }

    public function ubah(Request $request)
    {
        $api = new ApiMasterDocumentController();
        $api2 = new MasterTemplateDoc();
        $data = $request->all();
        $data['list_jenis'] = $api2->get();
        $data['data'] = $api->getDetailData($data['id'])->original;
        $view = view('page.mou.master_document.form.formadd', $data);

        $put['title_content'] = 'Ubah Document';
        $put['title_top'] = 'Ubah Document';
        $put['title_parent'] = $this->getTitleParent();
        $put['js'] = $this->getJs();
        $put['view_file'] = $view;
        return view('template.main', $put);
    }
}
