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
Route::get('kategori-doc/getData', 'App\Http\Controllers\api\KategoriMouController@getData');
Route::post('kategori-doc/submit', 'App\Http\Controllers\api\KategoriMouController@submit');
Route::post('kategori-doc/delete', 'App\Http\Controllers\api\KategoriMouController@delete');
Route::get('kategori-doc/filter', 'App\Http\Controllers\api\KategoriMouController@filter');

// Leveling MOU
Route::get('level-doc/getData', 'App\Http\Controllers\api\LevelingMouController@getData');
Route::post('level-doc/submit', 'App\Http\Controllers\api\LevelingMouController@submit');
Route::post('level-doc/delete', 'App\Http\Controllers\api\LevelingMouController@delete');
Route::get('level-doc/filter', 'App\Http\Controllers\api\LevelingMouController@filter');

// Leveling MOU
Route::get('jenis-doc/getData', 'App\Http\Controllers\api\JenisMouController@getData');
Route::post('jenis-doc/submit', 'App\Http\Controllers\api\JenisMouController@submit');
Route::post('jenis-doc/delete', 'App\Http\Controllers\api\JenisMouController@delete');
Route::get('jenis-doc/filter', 'App\Http\Controllers\api\JenisMouController@filter');

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

// MASTER TEMPLATE DOCUMENT
Route::get('master-template-doc/getData', 'App\Http\Controllers\api\MasterTemplateDocController@getData');
Route::post('master-template-doc/submit', 'App\Http\Controllers\api\MasterTemplateDocController@submit');
Route::post('master-template-doc/delete', 'App\Http\Controllers\api\MasterTemplateDocController@delete');
Route::get('master-template-doc/filter', 'App\Http\Controllers\api\MasterTemplateDocController@filter');
