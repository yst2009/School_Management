<?php

namespace App;
use App\Providers\RouteServiceProvide;
trait MultiAuth
{
    public function chekGuard($request){

        if($request->type == 'student'){
            $guardName= 'student';
        }
        elseif ($request->type == 'parent'){
            $guardName= 'parent';
        }
        elseif ($request->type == 'teacher'){
            $guardName= 'teacher';
        }
        else{
            $guardName= 'web';
        }
        return $guardName;
    }

    public function redirect($request){

        if($request->type == 'student'){
            return redirect()->intended(RouteServiceProvide::STUDENT);
        }
        elseif ($request->type == 'parent'){
            return redirect()->intended(RouteServiceProvide::PARENT);
        }
        elseif ($request->type == 'teacher'){
            return redirect()->intended(RouteServiceProvide::TEACHER);
        }
        else{
            return redirect()->intended(RouteServiceProvide::HOME);
        }
    }

}
