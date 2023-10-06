<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class LoginController extends Controller
{


    public function index()
    {
        return view('page.login');
    }
    public function authenticate(Request $request)
    {
        $data = $request->all();

        $validasi = [
            'username' => 'required',
            'password' => 'required',
        ];
        $message = ['required' => ':attribute harus diisi'];
        Validator::make($data, $validasi, $message)->validate();

        $userdata = DB::table('users as usr')
            ->select(['usr.*'])
            ->where('usr.username', '=', $data['username'])
            ->first();

        if ($userdata == null) {
            return redirect()->route('login')->with('error', 'Username tidak ditemukan');
        } else {
            $credentials = $request->only('username',  'password');
            if (Auth::attempt($credentials)) {
                $request->session()->regenerate();

                // join table
                $join_data = DB::table('users')
                    ->leftJoin('roles', 'users.role_id', '=', 'roles.id')
                    ->leftJoin('prodis', 'users.prodi_id', '=', 'prodis.id')
                    ->select('*')
                    ->where('users.id', '=', $userdata->id)
                    ->first();


                if ($join_data == null) {
                    $join_data = DB::table('users')
                        ->leftJoin('roles', 'users.role_id', '=', 'roles.id')
                        ->select('*')
                        ->where('users.id', '=', $userdata->id)
                        ->first();
                } else {
                    Session::put('prodi', $join_data->nama_prodi);
                }


                // dd($join_data);
                // put session
                Session::put('id', $userdata->id);
                Session::put('nama', $userdata->nama);
                Session::put('username', $userdata->username);
                Session::put('role', $join_data->nama_role);

                $data_detail_users =
                    DB::table('users as u')
                    ->leftJoin('detail_users as du', 'u.id', '=', 'du.users_id')
                    ->select('*')
                    ->where('du.users_id', '=', $userdata->id)
                    ->first();
                if ($data_detail_users != null) {
                    Session::put('nama_lengkap', $data_detail_users->nama_lengkap);
                    Session::put('foto', $data_detail_users->foto);
                }

                // masuk ke dashboard
                return redirect('home')->with('success', 'Selamat datang ' . session('nama'));
            }
            return redirect()->route('login')->with('error', 'Password salah');
        }
    }

    public function logout()
    {
        Auth::logout();
        request()->session()->invalidate();
        request()->session()->regenerateToken();

        return redirect('/')->with('success', 'Berhasil Logout');
    }
}
