<?php

use App\Http\Controllers\Parents\dashboard\ChildrenController;
use App\Models\Student;
use Illuminate\Support\Facades\Route;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
Route::group([
    'prefix' => LaravelLocalization::setLocale(),
    'middleware' => ['localeSessionRedirect', 'localizationRedirect', 'localeViewPath','auth:parent']
], function () {
    Route::get('/parent/dashboard',function (){
        $sons=Student::where('parent_id',auth()->guard('parent')->user()->id)->get();
        return view('pages.parents.dashboard',compact('sons'));
    });
    Route::get('children',[ChildrenController::class,'index'])->name('sons.index');//sons.results
    Route::get('children/results/{id}',[ChildrenController::class,'results'])->name('sons.results');//attendances
    Route::get('attendances',[ChildrenController::class,'attendances'])->name('sons.attendances');//sons.attendance.search
    Route::get('attendances/search',[ChildrenController::class,'attendanceSearch'])->name('sons.attendance.search');//fees
    Route::get('fees',[ChildrenController::class,'fees'])->name('sons.fees');//sons.fee.search
    Route::get('receipt/{id}',[ChildrenController::class,'receiptStudent'])->name('sons.receipt');//prodile
    Route::get('profile',[ChildrenController::class,'profile'])->name('sons.profile');//profile
    Route::post('profile/update/{id}',[ChildrenController::class,'profile_update'])->name('profile.update.parent');//profile.update

});
