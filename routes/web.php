<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Login
Route::get('/', 'App\Http\Controllers\LoginController@index')->name('login')->middleware('guest');
Route::post('/login', 'App\Http\Controllers\LoginController@authenticate')->name('signin')->middleware('guest');
Route::get('logout', 'App\Http\Controllers\LoginController@logout')->middleware('auth');

// Registrasi / Create Account
Route::get('registrasi', 'App\Http\Controllers\web\RegistrasiController@index')->name('registrasi')->middleware('guest');
Route::post('registrasi/submit', 'App\Http\Controllers\web\RegistrasiController@submit')->middleware('guest');



// Dashboard
Route::get('home', 'App\Http\Controllers\web\DashboardController@index')->middleware('auth');

// Profile
Route::get('profile/{id}', 'App\Http\Controllers\web\ProfileController@index')->middleware('auth');
Route::post('profile/{id}', 'App\Http\Controllers\web\ProfileController@submit')->middleware('auth');
Route::post('profile/auth/{id}', 'App\Http\Controllers\web\ProfileController@updateAuth')->middleware('auth');

// USER
Route::get('user', 'App\Http\Controllers\web\UserController@index')->middleware('auth');
Route::get('user/add', 'App\Http\Controllers\web\UserController@add')->middleware('auth');
Route::get('user/ubah', 'App\Http\Controllers\web\UserController@ubah')->middleware('auth');


// KATEGORI MOU
Route::get('kategori-doc', 'App\Http\Controllers\web\KategoriMouController@index')->middleware('auth');
Route::get('kategori-doc/index', 'App\Http\Controllers\web\KategoriMouController@index')->middleware('auth');
Route::get('kategori-doc/add', 'App\Http\Controllers\web\KategoriMouController@add')->middleware('auth');
Route::get('kategori-doc/ubah', 'App\Http\Controllers\web\KategoriMouController@ubah')->middleware('auth');

// JENIS MOU
Route::get('jenis-doc', 'App\Http\Controllers\web\JenisMouController@index')->middleware('auth');
Route::get('jenis-doc/index', 'App\Http\Controllers\web\JenisMouController@index')->middleware('auth');
Route::get('jenis-doc/add', 'App\Http\Controllers\web\JenisMouController@add')->middleware('auth');
Route::get('jenis-doc/ubah', 'App\Http\Controllers\web\JenisMouController@ubah')->middleware('auth');

// LEVELLING MOU
Route::get('level-doc', 'App\Http\Controllers\web\LevelingMouController@index')->middleware('auth');
Route::get('level-doc/index', 'App\Http\Controllers\web\LevelingMouController@index')->middleware('auth');
Route::get('level-doc/add', 'App\Http\Controllers\web\LevelingMouController@add')->middleware('auth');
Route::get('level-doc/ubah', 'App\Http\Controllers\web\LevelingMouController@ubah')->middleware('auth');

// ROLE MOU
Route::get('role', 'App\Http\Controllers\web\RoleController@index')->middleware('auth');
Route::get('role/index', 'App\Http\Controllers\web\RoleController@index')->middleware('auth');
Route::get('role/add', 'App\Http\Controllers\web\RoleController@add')->middleware('auth');
Route::get('role/ubah', 'App\Http\Controllers\web\RoleController@ubah')->middleware('auth');

// PRODI MOU
Route::get('prodi', 'App\Http\Controllers\web\ProdiController@index')->middleware('auth');
Route::get('prodi/index', 'App\Http\Controllers\web\ProdiController@index')->middleware('auth');
Route::get('prodi/add', 'App\Http\Controllers\web\ProdiController@add')->middleware('auth');
Route::get('prodi/ubah', 'App\Http\Controllers\web\ProdiController@ubah')->middleware('auth');

// MASTER TEMPLATE DOCUMENT
Route::get('master-template-doc', 'App\Http\Controllers\web\MasterTemplateDocController@index')->middleware('auth');
Route::get('master-template-doc/index', 'App\Http\Controllers\web\MasterTemplateDocController@index')->middleware('auth');
Route::get('master-template-doc/add', 'App\Http\Controllers\web\MasterTemplateDocController@add')->middleware('auth');
Route::get('master-template-doc/ubah', 'App\Http\Controllers\web\MasterTemplateDocController@ubah')->middleware('auth');

// MASTER DOCUMENT
Route::get('master-document', 'App\Http\Controllers\web\MasterDocumentController@index')->middleware('auth');
Route::get('master-document/index', 'App\Http\Controllers\web\MasterDocumentController@index')->middleware('auth');
Route::get('master-document/add', 'App\Http\Controllers\web\MasterDocumentController@add')->middleware('auth');
Route::get('master-document/ubah', 'App\Http\Controllers\web\MasterDocumentController@ubah')->middleware('auth');

// KEGIATAN
Route::get('kegiatan', 'App\Http\Controllers\web\KegiatanController@index')->middleware('auth');
Route::get('kegiatan/index', 'App\Http\Controllers\web\KegiatanController@index')->middleware('auth');
Route::get('kegiatan/add', 'App\Http\Controllers\web\KegiatanController@add')->middleware('auth');
Route::get('kegiatan/ubah', 'App\Http\Controllers\web\KegiatanController@ubah')->middleware('auth');
