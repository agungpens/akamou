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
Route::post('user/submit', 'App\Http\Controllers\api\UserController@submit');
Route::post('user/delete', 'App\Http\Controllers\api\UserController@delete');
Route::get('user/filter', 'App\Http\Controllers\api\UserController@filter');
// Kategori MOU
Route::get('kategori-mou/getData', 'App\Http\Controllers\api\KategoriMouController@getData');
Route::post('kategori-mou/submit', 'App\Http\Controllers\api\KategoriMouController@submit');
Route::post('kategori-mou/delete', 'App\Http\Controllers\api\KategoriMouController@delete');
Route::get('kategori-mou/filter', 'App\Http\Controllers\api\KategoriMouController@filter');

// Leveling MOU
Route::get('level-mou/getData', 'App\Http\Controllers\api\LevelingMouController@getData');
Route::post('level-mou/submit', 'App\Http\Controllers\api\LevelingMouController@submit');
Route::post('level-mou/delete', 'App\Http\Controllers\api\LevelingMouController@delete');
Route::get('level-mou/filter', 'App\Http\Controllers\api\LevelingMouController@filter');

// Leveling MOU
Route::get('jenis-mou/getData', 'App\Http\Controllers\api\JenisMouController@getData');
Route::post('jenis-mou/submit', 'App\Http\Controllers\api\JenisMouController@submit');
Route::post('jenis-mou/delete', 'App\Http\Controllers\api\JenisMouController@delete');
Route::get('jenis-mou/filter', 'App\Http\Controllers\api\JenisMouController@filter');

// ROLE USER
Route::get('role/getData', 'App\Http\Controllers\api\RoleController@getData');
Route::post('role/submit', 'App\Http\Controllers\api\RoleController@submit');
Route::post('role/delete', 'App\Http\Controllers\api\RoleController@delete');
Route::get('role/filter', 'App\Http\Controllers\api\RoleController@filter');
// PRODI
Route::get('prodi/getData', 'App\Http\Controllers\api\ProdiController@getData');
Route::post('prodi/submit', 'App\Http\Controllers\api\ProdiController@submit');
Route::post('prodi/delete', 'App\Http\Controllers\api\ProdiController@delete');
Route::get('prodi/filter', 'App\Http\Controllers\api\ProdiController@filter');
