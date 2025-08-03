<?php

namespace App\Http\Controllers\Students;

use App\Http\Controllers\Controller;
use App\Http\Traits\MeetingZoomTrait;
use App\Models\Grade;
use App\Models\online_classe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class OnlineClasseController extends Controller
{
    public function index()
    {
        $online_classes = online_classe::where('created_by', auth()->user()->email)->get();
        return view('pages.online_classes.index', compact('online_classes'));
    }


    public function create()
    {
        $Grades = Grade::all();
        return view('pages.online_classes.add', compact('Grades'));
    }

   

 public function generateZoomAccessToken()
    {
        $apiKey = env('Client_ID');
        $apiSecret = env('Client_Secret');
        $account_id = env('Account_ID');

        $base64Credentials = base64_encode("$apiKey:$apiSecret");

        $url = 'https://zoom.us/oauth/token?grant_type=account_credentials&account_id=' . $account_id;

        $response =Http::withHeaders([
            'Authorization' => "Basic $base64Credentials",
            'Content-Type' => 'application/x-www-form-urlencoded',
        ])->post($url);

        $responseData = $response->json();

        if (isset($responseData['access_token'])) {
            return $responseData['access_token'];
        } else {
            // Log or print the entire response for debugging purposes.
            Log::error('Zoom OAuth Token Response: ' . json_encode($responseData));

            // Handle the error as needed.
        }
    }
    public function store(Request $request)
{
    try {
        $accessToken = $this->generateZoomAccessToken();

        $url = 'https://api.zoom.us/v2/users/me/meetings';

        $response = Http::withToken($accessToken)->post($url, [
            'topic' => $request->topic,
            'type' => $request->type,
            'duration' => $request->duration,
            'start_url' => $request->start_url,
            'timezone' => 'Africa/Cairo',
        ]);

        // تحقق من الاستجابة
        $meetingData = $response->json();
        if ($response->failed()) {
            throw new \Exception('فشل إنشاء الاجتماع: ' . ($meetingData['message'] ?? 'خطأ غير معروف'));
        }

        // إنشاء السجل
        online_classe::create([
            'integration' => True,
            'Grade_id' => $request->Grade_id,
            'Classroom_id' => $request->Classroom_id,
            'section_id' => $request->section_id,
            'created_by' => auth()->user()->email,
            'meeting_id' => $meetingData['id'], // استخدام id من الاستجابة
            'topic' => $meetingData['topic'],
            'type' => $meetingData['type'],
            'start_at' => $request->start_time,
            'duration' => $request->duration,
            'password' => $meetingData['password'],
            'start_url'=>$meetingData['start_url'],
            'join_url' => $meetingData['join_url'],
        ]);

        return redirect()->route('online_classes.index');
    } catch (\Exception $e) {
        return redirect()->back()->withErrors(['error' => $e->getMessage()]);
    }
}
   


    public function show($id)
    {
        //
    }


    

    public function destroy(Request $request)
    {
        $meet=online_classe::findOrFail($request->id);

        $accessToken = $this->generateZoomAccessToken();
        $url = 'https://api.zoom.us/v2/meetings/' . $request->meeting_id;

        $response = Http::withToken($accessToken)->delete($url);

        if ($response->successful()) {
            $meet->delete();
            return redirect()->back(); 
        } else {
            // Handle the error
            return response()->json(['error' => 'Failed to delete the Zoom meeting'], 500);
        }
}
}
