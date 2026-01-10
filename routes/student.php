<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use App\Http\Controllers\Students\dashboard\ExamsController;
use App\Livewire\ShowQuestion;
use Livewire\Livewire;
use App\Http\Controllers\Students\dashboard\ProfileController;
/*
|--------------------------------------------------------------------------
| student Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//==============================Translate all pages============================
// Route::group(
//     [
//         'prefix' => LaravelLocalization::setLocale(),
//         'middleware' => ['localeSessionRedirect', 'localizationRedirect', 'localeViewPath', 'auth:student']
//     ], function () {
    
    //==============================dashboard============================
    Route::get('/student/dashboard', function () {
        return view('pages.Students.dashboard.dashboard');
    });
 Route::group(['student_exams' => 'App\Http\Controllers\Students\dashboard'], function () {
            Route::resource('student_exams',ExamsController::class);
        });
        Route::resource('profile-Student',ProfileController::class);
        

        
// });