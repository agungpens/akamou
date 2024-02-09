<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class LoginController extends Controller
{
    public function getTableName()
    {
        return "users";
    }

    public function getDataUser()
    {
        $result['is_valid'] = false;

        try {
            $result['data'] = User::all();
            $result['is_valid'] = true;
        } catch (\Throwable $th) {
            $result['message'] = $th->getMessage();
        }

        return response()->json($result);
    }
    public function loginApi(Request $request)
    {
        $result['is_valid'] = false;

        try {

            $loginData = $request->validate([
                'username' => 'required',
                'password' => 'required'
            ]);
            if (Auth::attempt($loginData)) {
                $token = Auth::user()->createToken('authToken')->plainTextToken;


                $result['data'] = Auth::user();
                $result['token'] = $token;
            }


            $result['is_valid'] = true;
        } catch (\Throwable $th) {
            $result['message'] = $th->getMessage();
        }

        return response()->json($result);
    }
}
