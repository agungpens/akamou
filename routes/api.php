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
Route::post('profile/submit', 'App\Http\Controllers\api\ProfileController@submit');

// user
Route::get('user/getData', 'App\Http\Controllers\api\UserController@getData');
Route::post('user/submit', 'App\Http\Controllers\api\UserController@submit');
Route::post('user/delete', 'App\Http\Controllers\api\UserController@delete');
Route::get('user/filter', 'App\Http\Controllers\api\UserController@filter');
// Kategori MOU
Route::post('kategori-doc/getData', 'App\Http\Controllers\api\KategoriMouController@getData');
Route::post('kategori-doc/submit', 'App\Http\Controllers\api\KategoriMouController@submit');
Route::post('kategori-doc/delete', 'App\Http\Controllers\api\KategoriMouController@delete');
Route::get('kategori-doc/filter', 'App\Http\Controllers\api\KategoriMouController@filter');

// Leveling MOU
Route::post('level-doc/getData', 'App\Http\Controllers\api\LevelingMouController@getData');
Route::post('level-doc/submit', 'App\Http\Controllers\api\LevelingMouController@submit');
Route::post('level-doc/delete', 'App\Http\Controllers\api\LevelingMouController@delete');
Route::get('level-doc/filter', 'App\Http\Controllers\api\LevelingMouController@filter');

// Jenis MOU
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
Route::post('prodi/getData', 'App\Http\Controllers\api\ProdiController@getData');
Route::post('prodi/submit', 'App\Http\Controllers\api\ProdiController@submit');
Route::post('prodi/delete', 'App\Http\Controllers\api\ProdiController@delete');
Route::get('prodi/filter', 'App\Http\Controllers\api\ProdiController@filter');

// MASTER TEMPLATE DOCUMENT
Route::get('master-template-doc/getData', 'App\Http\Controllers\api\MasterTemplateDocController@getData');
Route::post('master-template-doc/submit', 'App\Http\Controllers\api\MasterTemplateDocController@submit');
Route::post('master-template-doc/delete', 'App\Http\Controllers\api\MasterTemplateDocController@delete');
Route::get('master-template-doc/filter', 'App\Http\Controllers\api\MasterTemplateDocController@filter');
Route::post('master-template-doc/execUploadFile', 'App\Http\Controllers\api\MasterTemplateDocController@execUploadFile');

// MOU DOCUMENT
Route::post('dokumen-mou/getData', 'App\Http\Controllers\api\DokumenMouController@getData');
Route::post('dokumen-mou/submit', 'App\Http\Controllers\api\DokumenMouController@submit');
Route::post('dokumen-mou/delete', 'App\Http\Controllers\api\DokumenMouController@delete');
Route::get('dokumen-mou/filter', 'App\Http\Controllers\api\DokumenMouController@filter');
Route::post('dokumen-mou/execUploadFile', 'App\Http\Controllers\api\DokumenMouController@execUploadFile');

// MOA DOCUMENT
Route::post('dokumen-moa/getData', 'App\Http\Controllers\api\DokumenMoaController@getData');
Route::post('dokumen-moa/submit', 'App\Http\Controllers\api\DokumenMoaController@submit');
Route::post('dokumen-moa/updated', 'App\Http\Controllers\api\DokumenMoaController@updated');
Route::post('dokumen-moa/delete', 'App\Http\Controllers\api\DokumenMoaController@delete');
Route::post('dokumen-moa/execUploadFile', 'App\Http\Controllers\api\DokumenMoaController@execUploadFile');
Route::post('dokumen-moa/showDataMou', 'App\Http\Controllers\api\DokumenMoaController@showDataMou');
Route::post('dokumen-moa/showDataKategori', 'App\Http\Controllers\api\DokumenMoaController@showDataKategori');
Route::post('dokumen-moa/showDataLevel', 'App\Http\Controllers\api\DokumenMoaController@showDataLevel');
Route::post('dokumen-moa/showDataProdi', 'App\Http\Controllers\api\DokumenMoaController@showDataProdi');
Route::post('dokumen-moa/getDataMoa', 'App\Http\Controllers\api\DokumenMoaController@getDataMoa');

// KEGIATAN
Route::post('kegiatan/getData', 'App\Http\Controllers\api\KegiatanController@getData');
Route::post('kegiatan/submit', 'App\Http\Controllers\api\KegiatanController@submit');
Route::post('kegiatan/updated', 'App\Http\Controllers\api\KegiatanController@updated');
Route::post('kegiatan/delete', 'App\Http\Controllers\api\KegiatanController@delete');
Route::post('kegiatan/deleteDataLampiran', 'App\Http\Controllers\api\KegiatanController@deleteDataLampiran');
Route::post('kegiatan/execUploadFile', 'App\Http\Controllers\api\KegiatanController@execUploadFile');
Route::post('kegiatan/showDataMou', 'App\Http\Controllers\api\KegiatanController@showDataMou');
Route::post('kegiatan/showDataKategori', 'App\Http\Controllers\api\KegiatanController@showDataKategori');
Route::post('kegiatan/showDataLevel', 'App\Http\Controllers\api\KegiatanController@showDataLevel');
Route::post('kegiatan/showDataProdi', 'App\Http\Controllers\api\KegiatanController@showDataProdi');
Route::post('kegiatan/showDataMoa', 'App\Http\Controllers\api\KegiatanController@showDataMoa');


// Log User
Route::post('log-user/getData', 'App\Http\Controllers\api\LogUserController@getData');



// MOBILE API
// Login User With API
Route::post('login/loginApi', 'App\Http\Controllers\api\LoginController@loginApi');
Route::post('login/getDataUser', 'App\Http\Controllers\api\LoginController@getDataUser')->middleware("auth:sanctum");

Route::post('prodi/getDataForMobile', 'App\Http\Controllers\api\ProdiController@getDataForMobile');
