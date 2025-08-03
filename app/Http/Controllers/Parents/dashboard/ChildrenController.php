<?php

namespace App\Http\Controllers\Parents\dashboard;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Student;
use App\Models\Degree;
use Brian2694\Toastr\Facades\Toastr;
use App\Models\Attendance;
use App\Models\Fee_invoice;
use App\Models\My_Parent;
use Illuminate\Support\Facades\DB;
use App\Models\ReceiptStudent;
use Illuminate\Support\Facades\Hash;
class ChildrenController extends Controller
{
   
    public function index()
    {
        $students=Student::where('parent_id',auth()->guard('parent')->user()->id)->get();
        return view('pages.parents.children.index',compact('students'));
    }
    
    
 public function attendances()
    {
        $students = Student::where('parent_id', auth()->guard('parent')->user()->id)->get();
        return view('pages.parents.Attendance.index', compact('students'));
    }

    
    public function results(int $id)
    {
        $student=Student::findOrFail($id);
        if ($student->parent_id==auth()->guard('parent')->user()->id){
            $degrees=Degree::where('student_id',$id)->get();
            if($degrees->isEmpty()){
                toastr()->success('No degrees found');
                return redirect()->back();
            }
            toastr()->success('Degrees found');
            return view('pages.parents.degrees.index',compact('degrees'));
        }
        else {
            echo "no";
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
      public function attendanceSearch(Request $request)
    {
        $request->validate([
            'from' => 'required|date|date_format:Y-m-d',
            'to' => 'required|date|date_format:Y-m-d|after_or_equal:from'
        ], [
            'to.after_or_equal' => 'تاريخ النهاية لابد ان اكبر من تاريخ البداية او يساويه',
            'from.date_format' => 'صيغة التاريخ يجب ان تكون yyyy-mm-dd',
            'to.date_format' => 'صيغة التاريخ يجب ان تكون yyyy-mm-dd',
        ]);

        $ids = Student::where('parent_id', auth()->guard('parent')->user()->id)->pluck('section_id');
        $students = Student::whereIn('section_id', $ids)->get();

        if ($request->student_id == 0) {

            $Students = Attendance::whereBetween('attendence_date', [$request->from, $request->to])->get();
            return view('pages.parents.Attendance.index', compact('Students', 'students'));
        } else {

            $Students = Attendance::whereBetween('attendence_date', [$request->from, $request->to])
                ->where('student_id', $request->student_id)->get();
            return view('pages.parents.Attendance.index', compact('Students', 'students'));

        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function fees()
    {
        $students_id = Student::where('parent_id', auth()->guard('parent')->user()->id)->pluck('id');
        $Fee_invoices = Fee_invoice::whereIn('student_id', $students_id)->get();
        return view('pages.parents.Fees.index', compact('Fee_invoices'));
    }

    /**
     * Remove the specified resource from storage.
     */
   public function receiptStudent($id){

        $student = Student::findorFail($id);
        if ($student->parent_id !== auth()->guard('parent')->user()->id) {
            toastr()->error('يوجد خطا في كود الطالب');
            return redirect()->route('sons.fees');
        }

        $receipt_students = ReceiptStudent::where('student_id',$id)->get();

        if ($receipt_students->isEmpty()) {
            toastr()->error('لا توجد مدفوعات لهذا الطالب');
            return redirect()->route('sons.fees');
        }
        return view('pages.parents.Receipt.index', compact('receipt_students'));

    }
    public function profile()
    {
        $information=My_Parent::findorFail(auth()->guard('parent')->user()->id);
        return view('pages.parents.profile',compact('information'));
    }
    public function profile_update(Request $request, $id)
    {

        $information = My_Parent::findorFail($id);

        if (!empty($request->password)) {
            $information->Name_Father = ['en' => $request->Name_en, 'ar' => $request->Name_ar];
            $information->password = Hash::make($request->password);
            $information->save();
        } else {
            $information->Name_Father = ['en' => $request->Name_en, 'ar' => $request->Name_ar];
            $information->save();
        }
        toastr()->success(trans('messages.Update'));
        return redirect()->back();


    }
}
