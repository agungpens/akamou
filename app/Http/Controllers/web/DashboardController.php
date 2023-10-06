<?php

namespace App\Http\Controllers\web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class DashboardController extends Controller
{

    public function getTitleParent()
    {
        return "Dashboard";
    }

    public function index()
    {
        $data['data'] = [];
        $view = view('page.dashboard', $data);
        $put['title_content'] = 'Home';
        $put['title_top'] = 'Home';
        $put['title_parent'] = $this->getTitleParent();
        $put['view_file'] = $view;

        return view('template.main', $put);
    }
}
