<?php

namespace App\Http\Controllers\web;

use App\Http\Controllers\Controller;
use App\Models\JenisMou;
use App\Http\Controllers\api\MasterTemplateDocController as ApiMasterTemplateDocController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MasterTemplateDocController extends Controller
{
    public function getTitleParent()
    {
        return "Data MOU";
    }

    public function getJs()
    {
        return asset('assets/js/controller/mou/master_template_doc.js');
    }

    public function index()
    {
        $data['data'] = [];
        $view = view('page.mou.master_template_doc.index', $data);
        $put['title_content'] = 'Master Template Document';
        $put['title_top'] = 'Master Template Document';
        $put['title_parent'] = $this->getTitleParent();
        $put['js'] = $this->getJs();
        $put['view_file'] = $view;

        return view('template.main', $put);
    }


    public function add()
    {
        $data['data'] = [];
        $view = view('page.mou.master_template_doc.form.formadd', $data);
        $put['title_content'] = 'Tambah Jenis';
        $put['title_top'] = 'Tambah Jenis';
        $put['title_parent'] = $this->getTitleParent();
        $put['js'] = $this->getJs();
        $put['view_file'] = $view;

        return view('template.main', $put);
    }

    public function ubah(Request $request)
    {
        $api = new ApiMasterTemplateDocController();
        $data = $request->all();
        $data['data'] = $api->getDetailData($data['id'])->original;
        $view = view('page.mou.master_template_doc.form.formadd', $data);

        $put['title_content'] = 'Ubah Jenis';
        $put['title_top'] = 'Ubah Jenis';
        $put['title_parent'] = $this->getTitleParent();
        $put['js'] = $this->getJs();
        $put['view_file'] = $view;
        return view('template.main', $put);
    }
}
