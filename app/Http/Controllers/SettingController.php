<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use Illuminate\Http\Request;
Use App\AttachFilesTrait;

class SettingController extends Controller
{
    use AttachFilesTrait;
    /**
     * Display a listing of the resource.
     */
   public function index(){

        $collection = Setting::all();
        $setting['setting'] = $collection->flatMap(function ($collection) {
            return [$collection->key => $collection->value];
        });
        return view('pages.setting.index', $setting);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Setting $setting)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Setting $setting)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        try{
            $info = $request->except('_token', '_method', 'logo');
            
            foreach($info as $key=>$value)
            {
                Setting::where('key', $key)->update(['value' => $value]);
            }

            if($request->hasFile('logo')) {
                $logo_name = $request->file('logo')->getClientOriginalName();
                Setting::where('key', 'logo')->update(['value' => $logo_name]);
                $this->uploadFile($request,'logo','logo');
            }
            return redirect()->back();

        }catch (\Exception $e){

            return redirect()->back()->with(['error' => $e->getMessage()]);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Setting $setting)
    {
        //
    }
}
