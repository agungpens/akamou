<?php

use App\Http\Controllers\api\profileController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::post('profile/loadFormAuth', 'App\Http\Controllers\api\ProfileController@loadFormAuth');

// user
Route::get('user/getData', 'App\Http\Controllers\api\UserController@getData');
Route::post('user/delete', 'App\Http\Controllers\api\userController@delete');
Route::get('user/filter', 'App\Http\Controllers\api\userController@filter');
// Kategori MOU
Route::get('kategori-mou/getData', 'App\Http\Controllers\api\KategoriMouController@getData');
Route::post('kategori-mou/submit', 'App\Http\Controllers\api\KategoriMouController@submit');
Route::post('kategori-mou/delete', 'App\Http\Controllers\api\KategoriMouController@delete');
Route::get('kategori-mou/filter', 'App\Http\Controllers\api\KategoriMouController@filter');
