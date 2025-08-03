<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class Authen
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
     protected function redirectTo($request)
    {
        if (! $request->expectsJson()) {
            if(Request::is(app()->getLocale().'/student/dashboard')){
                return route('seletion');
            }
           else if(Request::is(app()->getLocale().'/parent/dashboard')){
                return route('seletion');
            }
            else if(Request::is(app()->getLocale()."/teacher/dashboard")){
                return route('seletion');
            }
            else {
               return route('seletion');

            }
        }
    }
}
