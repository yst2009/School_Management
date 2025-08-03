<?php

namespace App\Repository;

use App\Models\Grade;
use App\Models\Library;
use App\Models\Teacher;
use Illuminate\Support\Facades\Storage;
use App\Models\Section;

class LibraryRepository implements LibraryRepositoryInterface
{


    public function index()
    {
        $books = Library::all();
        return view('pages.library.index',compact('books'));
    }

    public function create()
    {
        $grades = Grade::all();
        $sections=Section::with(['teachers'])->get();
        return view('pages.library.create',compact('grades','sections'));
    }

    public function store($request)
    {
        try {
             $books = new Library();
            $books->title = $request->title;
            $books->file_name =  $request->file('file_name')->getClientOriginalName();
            $books->Grade_id = $request->Grade_id;
            $books->classroom_id = $request->Classroom_id;
            $books->section_id = $request->section_id;
            $books->teacher_id = $request->teacher_id;
            
            $books->save();
            if($request->hasfile('file_name')){
                $name=$request->file('file_name')->getClientOriginalName();
                $request->file('file_name')->storeAs('attachments/Library/'.$name,$books->title,'upload_attachments');
            }
            toastr()->success(trans('messages.success'));
            return redirect()->route('library.index');
        } catch (\Exception $e) {
            return redirect()->back()->with(['error' => $e->getMessage()]);
        }
    }

   

    public function destroy($request)
    {

        $exists=Storage::disk('upload_attachments')->exists('attachments/library/'.$request->name);
        if( $exists ){
         Storage::disk('upload_attachments')->delete('attachments/library/'.$request->name);
        }
        Library::destroy($request->id);
        return redirect()->route('library.index');
    }

    public function download($filename)
    {
        return response()->download(public_path('attachments/library/'.$filename));
    }
}