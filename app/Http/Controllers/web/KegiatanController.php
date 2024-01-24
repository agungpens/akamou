<?php

namespace App\Http\Controllers\web;

use App\Http\Controllers\Controller;
use App\Models\kegiatanMou;
use App\Http\Controllers\api\KegiatanController as ApiKegiatanController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class KegiatanController extends Controller
{
    public function getTitleParent()
    {
        return "Data MOU";
    }

    public function getJs()
    {
        return asset('assets/js/controller/mou/kegiatan.js');
    }

    public function index()
    {
        $data['data'] = [];
        $view = view('page.mou.kegiatan.index', $data);
        $put['title_content'] = 'kegiatan MOU';
        $put['title_top'] = 'kegiatan MOU';
        $put['title_parent'] = $this->getTitleParent();
        $put['js'] = $this->getJs();
        $put['view_file'] = $view;

        return view('template.main', $put);
    }


    public function add()
    {
        $data['data'] = [];
        $view = view('page.mou.kegiatan.form.formadd', $data);
        $put['title_content'] = 'Tambah kegiatan';
        $put['title_top'] = 'Tambah kegiatan';
        $put['title_parent'] = $this->getTitleParent();
        $put['js'] = $this->getJs();
        $put['view_file'] = $view;

        return view('template.main', $put);
    }

    public function ubah(Request $request)
    {
        $api = new ApiKegiatanController();
        $data = $request->all();
        $data['data'] = $api->getDetailData($data['id'])->original;
        $view = view('page.mou.kegiatan.form.formadd', $data);

        $put['title_content'] = 'Ubah kegiatan';
        $put['title_top'] = 'Ubah kegiatan';
        $put['title_parent'] = $this->getTitleParent();
        $put['js'] = $this->getJs();
        $put['view_file'] = $view;
        return view('template.main', $put);
    }
}
