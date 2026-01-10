<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Providers\RouteServiceProvide;
class RedirectAuthen
{

    public function handle(Request $request, Closure $next): Response
    {
        if(auth('web')->check()){
            return redirect(RouteServiceProvide::HOME);
        }
        if(auth('student')->check()){
        return redirect(RouteServiceProvide::STUDENT);
        }
         if(auth('teacher')->check()){
        return redirect(RouteServiceProvide::TEACHER);
        }
         if(auth('parent')->check()){
        return redirect(RouteServiceProvide::PARENT);
        }
        

        return $next($request);    
    }
}
