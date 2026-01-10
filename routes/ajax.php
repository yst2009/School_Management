<?php

use Illuminate\Support\Facades\Route;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use App\Http\Controllers\Students\StudentController;
use App\Http\Controllers\Students\OnlineClasseController;
Route::group([
    'prefix' => LaravelLocalization::setLocale(),
    'middleware' => ['localeSessionRedirect', 'localizationRedirect', 'localeViewPath','auth:web,teacher']
], function () {
    Route::get('/Get_classrooms/{id}', [StudentController::class, 'Get_classrooms']);
    Route::get('/Get_Sections/{id}', [StudentController::class, 'Get_Sections']);
});