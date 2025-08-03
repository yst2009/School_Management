<?php

use App\Http\Controllers\Teachers\dashboard\ProfileController;
use App\Models\Student;
use App\Models\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use App\Http\Controllers\Teachers\dashboard\Studentcontroller;
use App\Http\Controllers\Teachers\dashboard\QuizzController;
use App\Http\Controllers\Teachers\dashboard\QuestionsController;



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
Route::group(
    [
        'prefix' => LaravelLocalization::setLocale(),
        'middleware' => ['localeSessionRedirect', 'localizationRedirect', 'localeViewPath', 'auth:teacher']
    ], function () {

    //==============================dashboard============================
    Route::get('/teacher/dashboard', function () {
        $ids=Teacher::findOrFail(auth()->guard('teacher')->user()->id)->Sections()->pluck('section_id');

        $count_sections=$ids->count();
        $count_students=Student::whereIn('section_id',$ids)->count();
        return view('pages.Teachers.dashboard.dashboard',compact('count_sections','count_students'));
    });
        Route::group(['Students' => 'App\Http\Controllers\Teachers\dashboard'], function () {
            Route::get('student',[Studentcontroller::class,'index'])->name('student.index');
            Route::get('sections',[Studentcontroller::class,'sections'])->name('sections');
            Route::get('attendance',[Studentcontroller::class,'attendance'])->name('attendance');
            Route::get('attendance_report',[Studentcontroller::class,'Attendance_Report'])->name('attendance.report');
            Route::get('Attendance_Search',[Studentcontroller::class,'Attendance_Search'])->name('attendance.search');
        });
        Route::group(['quizzes' => 'App\Http\Controllers\Teachers\dashboard'], function () {
            Route::resource('quizzes',QuizzController::class);
        });
         Route::group(['questions' => 'App\Http\Controllers\Teachers\dashboard'], function () {
            Route::resource('question',QuestionsController::class);  
        });
         Route::get('profile/index',[ProfileController::class,'index'])->name('profile.index');
        Route::post('profile_update/{id}',[ProfileController::class,'update'])->name('profile.update');//student.quizze
        Route::get('student/quizzes/{quizze_id}',[QuizzController::class,'student_quizze'])->name('student.quizze');
        Route::post('repeat/quizze/{quizze_id}',[QuizzController::class,'repeat_quizze'])->name('repeat.quizze');
        
});
