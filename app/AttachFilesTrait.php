<?php

namespace App;
use Illuminate\Support\Facades\Storage;

trait AttachFilesTrait
{
    public function uploadFile($request,$name,$folder){
        $file=$request->file($name)->getClientOriginalName();
        $request->file($name)->storeAs('attachments/'.$folder."/".$file,'upload_attachments');    
    }
    public function deleteFile($name){
        $exists = Storage::disk('upload_attachments')->exists('attachments/library/'.$name);
        if ($exists){
            Storage::disk('upload_attachments')->delete('attachments/library/'.$name);
        }

    }
}