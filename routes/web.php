<?php

use App\Http\Controllers\SettingController;
use App\Http\Controllers\Students\LibraryController;
use Illuminate\Support\Facades\Route;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\Grades\GradeController;
use App\Http\Controllers\Classrooms\ClassroomController;
use App\Http\Controllers\Sections\SectionController;
use App\Livewire\AddParent;

use App\Http\Controllers\Teachers\TeacherController;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Students\StudentController;
use App\Http\Controllers\Students\OnlineClasseController;
use App\Http\Controllers\Students\GraduatedController;
use App\Http\Controllers\Students\PromotionController;
use App\Http\Controllers\Students\FeesController;
use App\Http\Controllers\Students\FeesInvoicesController;
use App\Http\Controllers\Students\ReceiptStudentsController;
use App\Http\Controllers\Students\ProcessingFeeController;
use App\Http\Controllers\Students\PaymentController;
use App\Http\Controllers\Students\AttendanceController;
use App\Http\Controllers\Subjects\SubjectController;
use App\Http\Controllers\Quizzes\QuizzController;
use App\Http\Controllers\Questions\QuestionController;
use App\Http\Controllers\Auth\LoginController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
// routes/web.php
require base_path('routes/parent.php');
// Auth::routes();

// Route::group(['middleware' => ['guest']], function () {

//     Route::get('/', function () {
//         return view('auth.login');
//     });

// });

 Route::get('/', [HomeController::class,'index'])->name('seletion');

Route::group(['namespace' => 'Auth'], function () {

Route::get('/login/{type}',[LoginController::class,'loginForm'])->middleware('guest')->name('login.show');

Route::post('/login',[LoginController::class,'login'])->name('login');
Route::get('/logout/{type}',[LoginController::class,'logout'])->name('logout');


});



 //==============================Translate all pages============================
Route::group(
    [
        'prefix' => LaravelLocalization::setLocale(),
        'middleware' => ['localeSessionRedirect', 'localizationRedirect', 'localeViewPath', 'auth']
    ], function () {

     //==============================dashboard============================
    Route::get('/dashboard', [HomeController::class,'index2'])->name('dashboard');

   //==============================dashboard============================
    Route::group(['Grades' => 'App\Http\Controllers\Grades'], function () {
        Route::resource('Grades', GradeController::class);
    });

    //==============================Classrooms============================
    Route::group(['Classrooms' => 'App\Http\Controllers\Classrooms'], function () {
        Route::resource('Classrooms', ClassroomController::class);
        Route::post('delete_all', [ClassroomController::class, 'delete_all'])->name('delete_all');

        Route::post('Filter_Classes', [ClassroomController::class ,'Filter_Classes'])->name('Filter_Classes');

    });


    //==============================Sections============================

    Route::group(['Sections' => 'Sections'], function () {

        Route::resource('Sections', SectionController::class);

        Route::get('/classes/{id}', [SectionController::class ,'getclasses']);

    });

    //==============================parents============================

        Route::view('ar/add_parent','livewire.show_Form');
Route::get('add_parent', function () {
    return view('livewire.show_Form');
})->name('add_parent');
        Route::view('en/add_parent','livewire.show_Form');

    //==============================Teachers============================
    Route::group(['Teachers' => 'App\Http\Controllers\Teachers'], function () {
        Route::resource('Teachers', TeacherController::class);
    });

    //==============================Students============================
    Route::group(['Students' => 'App\Http\Controllers\Students'], function () {
        Route::resource('Students', StudentController::class);
        Route::resource('Graduated', GraduatedController::class);
        Route::resource('Promotion', PromotionController::class);
        Route::resource('Fees_Invoices', FeesInvoicesController::class);
        Route::resource('Fees', FeesController::class);
        Route::resource('receipt_students', ReceiptStudentsController::class);
        Route::resource('ProcessingFee', ProcessingFeeController::class);
        Route::resource('Payment_students', PaymentController::class);
        Route::resource('Attendance', AttendanceController::class);
        Route::post('Upload_attachment', [StudentController::class, 'Upload_attachment'])->name('Upload_attachment');
        Route::get('Download_attachment/{studentsname}/{filename}', [StudentController::class, 'Download_attachment'])->name('Download_attachment');
        Route::post('Delete_attachment', [StudentController::class, 'Delete_attachment'])->name('Delete_attachment');
        Route::get('Online_classes', [StudentController::class, 'Online_classes'])->name('Online_classes');
        Route::get('Online_classes/index    ', [StudentController::class, 'index'])->name('online_classes.index');
    });

    //==============================subjects============================
    Route::group(['Subjects' => 'Subjects'], function () {
        Route::resource('subjects', SubjectController::class);
    });

    //==============================Quizzes============================
    Route::group(['Quizzes' => 'Quizzes'], function () {
        Route::resource('Quizzes', QuizzController::class);
    });

    //==============================questions============================
    Route::group(['questions' => 'questions'], function () {
        Route::resource('questions', QuestionController::class);
    });
    Route::resource('library',LibraryController::class);
    Route::get('settings/index',[SettingController::class,'index'])->name('settings.index');
    Route::post('settings/update',[SettingController::class,'update'])->name('settings.update');

    Route::get('downloadAttachment/{filename}',[LibraryController::class,'download'])->name('downloadAttachment');

});
    