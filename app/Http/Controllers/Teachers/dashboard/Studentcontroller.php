<?php

namespace App\Http\Controllers\Teachers\dashboard;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Teacher;
use App\Models\Student;
use App\Models\Section;
use App\Models\Attendance;
use Exception;


class Studentcontroller extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $ids=Teacher::findorfail(auth()->user()->id)->Sections()->pluck('section_id');
        $students=Student::whereIn('section_id',$ids)->get();
        return view('pages.teachers.dashboard.students.index',compact('students'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function sections()
    {
        $sections=Teacher::findorfail(auth()->user()->id)->Sections()->get();
        return view('pages.Teachers.dashboard.sections.index', compact('sections'));

    }

    /**
     * Store a newly created resource in storage.
     */
    public function attendance(Request $request)
    {

        try {

            $attenddate = date('Y-m-d');
            $classid = $request->section_id;
            foreach ($request->attendences as $studentid => $attendence) {

                if ($attendence == 'presence') {
                    $attendence_status = true;
                } else if ($attendence == 'absent') {
                    $attendence_status = false;
                }

                Attendance::updateOrCreate([
                    'student_id'=>$studentid,
                    'attendence_date' => $attenddate,                    
            ],
            [
                    'student_id' => $studentid,
                    'grade_id' => $request->grade_id,
                    'classroom_id' => $request->classroom_id,
                    'section_id' => $request->section_id,
                    'teacher_id' => 1,
                    'attendence_date' => $attenddate,
                    'attendence_status' => $attendence_status
                ]);
            }
            toastr()->success(trans('messages.success'));
            return redirect()->back();
        } catch (Exception $e) {
            return redirect()->back()->withErrors(['error' => $e->getMessage()]);
        }
    }


    public function Attendance_Report()
    {
        $ids=Teacher::findorfail(auth()->user()->id)->Sections()->pluck('section_id');
        $students=Student::whereIn('section_id',$ids)->get();
        return view('pages.teachers.dashboard.students.Attendance_Report',compact('students'));
    }
   


    /**
     * Update the specified resource in storage.
     */
    public function Attendance_Search(Request $request)
    {
        $request->validate([
            'from' => 'required|',
            'to' => 'required'

        ]);

        $ids=Teacher::findorfail(auth()->user()->id)->Sections()->pluck('section_id');

        $students=Student::whereIn('section_id',$ids)->get();

        if($request->student_id==0){
            
        $Students = Attendance::whereBetween('attendence_date', [$request->from, $request->to])->get();
        return view('pages.Teachers.dashboard.students.attendance_report',compact('Students','students'));
        }
        else {

       $Students = Attendance::whereBetween('attendence_date', [$request->from, $request->to])
       ->where('student_id',$request->student_id)->get();
       return view('pages.Teachers.dashboard.students.attendance_report',compact('Students','students'));

        }

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
