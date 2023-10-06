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
Route::post('login', 'App\Http\Controllers\LoginController@authenticate')->name('signin')->middleware('guest');
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
Route::get('user', 'App\Http\Controllers\web\userController@index')->name('user')->middleware('auth');
Route::get('user/add', 'App\Http\Controllers\web\userController@add')->middleware('auth');
Route::get('user/ubah', 'App\Http\Controllers\web\userController@ubah')->middleware('auth');
Route::post('user/submit', 'App\Http\Controllers\web\userController@submit')->middleware('auth');
