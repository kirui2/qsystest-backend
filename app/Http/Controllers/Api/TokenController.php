<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Token;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use AfricasTalking\SDK\AfricasTalking;
use GuzzleHttp\Exception\ClientException;

class TokenController extends Controller
{

    public function operatorId(Request $request)
    {
        
        $operatorId = Auth::id();
        
        $tokensForOperator = Token::where('counter', $operatorId)
            ->join('users', 'users.id', '=', 'tokens.counter')
            ->select('tokens.*')
            ->get();

        return response()->json(['tokens_for_operator' => $tokensForOperator], 200);
    }

    public function tokensServedByOperator($operatorId)
    {
        $tokensServed = Token::where('counter', $operatorId)->count();
    
        return response()->json(['tokens_served' => $tokensServed], 200);
    }

    public function tokensServedByOperators()
{
    $tokensServedByOperators = Token::select('counter', DB::raw('count(*) as tokens_served'))
    ->whereNotNull('counter')
        ->groupBy('counter')
        ->get();

    return response()->json(['tokens_served_by_operators' => $tokensServedByOperators], 200);
}

public function tokenComparison()
{
    $pickedTokens = Token::where('status', 0)->count();
    $completedTokens = Token::where('status', 1)->count();

    return response()->json([
        'picked_tokens_count' => $pickedTokens,
        'completed_tokens_count' => $completedTokens
    ], 200);
}


public function trendAnalysis()
{
    // Get the current date and time
    $currentDateTime = Carbon::now();

    // Get the tokens count by each hour
    $tokensByHour = Token::selectRaw('HOUR(date_time) as hour, COUNT(*) as token_count')
        ->whereDate('date_time', $currentDateTime->toDateString()) // Get records of the current day
        ->groupBy('hour')
        ->orderBy('hour', 'asc')
        ->get();

    // Calculate the remaining hours until midnight
    $currentHour = $currentDateTime->hour;
    $hoursRemaining = 24 - $currentHour;

    // Predict tokens by the end of the day
    $predictedTokens = $tokensByHour->sum('token_count') + (($tokensByHour->count() > 0) ? ($tokensByHour->avg('token_count') * $hoursRemaining) : 0);

    return response()->json([
        'tokens_by_hour' => $tokensByHour,
        'predicted_tokens_by_midnight' => $predictedTokens
    ], 200);
}

    public function generateToken(Request $request)
    {
        $validatedData = $request->validate([
            'mobile_number' => 'required|numeric',
            'service' => 'required|in:General Enquiries,Decoder Renewal',
        ]);

        $selectedService = $validatedData['service'];
        $mobileNumber = $validatedData['mobile_number'];
        $dateTime = now();

        $token = Token::create([
            'mobile_number' => $mobileNumber,
            'service' => $selectedService,
            'date_time' => $dateTime,
            'status' => 0,
            'counter' => null,
        ]);
        

        $formattedId = sprintf('A%03d', $token->id);

        $token->update([
            'token' => $formattedId,
        ]);
        
        $formattedDateTime = date('d-m-Y g:i:sA', strtotime($dateTime));


        // Sending SMS 
        $message = "Welcome!\nService: {$selectedService}.\nToken Number is: {$formattedId}.\nDate: {$formattedDateTime}";


        $smsApiUrl = 'https://bulk.alvar.co.ke/sms/v3/sendsms';
        $smsRequestBody = [
            "api_key" => "TlrGhwgYUfn9MxCNzZtyREI0bJ1m7VP52iB8Q3voKjuHe6cDaOXWASLFk4spqd",
            "service_id" => 0,
            "mobile" => $mobileNumber,
            "response_type" => "json",
            "shortcode" => "Hezamu",
            "message" => $message,
        ];

        $this->sendSMS($smsApiUrl, $smsRequestBody);

        return response()->json(['token' => $formattedId], 201)
        ->header('Access-Control-Allow-Origin', 'http://localhost:3000/')
        ->header('Access-Control-Allow-Methods', 'POST')
        ->header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    }

    // public function generateToken(Request $request)
    // {
    //     $validatedData = $request->validate([
    //         'mobile_number' => 'required|numeric',
    //         'service' => 'required|in:General Enquiries,Decoder Renewal',
    //     ]);

    //     $selectedService = $validatedData['service'];
    //     $mobileNumber = $validatedData['mobile_number'];
    //     $dateTime = now();

    //     $token = Token::create([
    //         'mobile_number' => $mobileNumber,
    //         'service' => $selectedService,
    //         'date_time' => $dateTime,
    //         'status' => 0,
    //         'counter' => null,
    //     ]);

    //     $formattedId = sprintf('A%03d', $token->id);

    //     $token->update([
    //         'token' => $formattedId,
    //     ]);

    //     $formattedDateTime = date('d-m-Y g:i:sA', strtotime($dateTime));

    //     // Sending SMS using Africa's Talking
    //     $message = "Welcome!\nService: {$selectedService}.\nToken Number is: {$formattedId}.\nDate: {$formattedDateTime}";

    //     // Initialize Africa's Talking SDK
    //     $username = 'sandbox';
    //     $apiKey = '3d8111ede46b347be157c8ab960981c63b4651e7569770a635db6684a8464703';
    

    //     $AT = new AfricasTalking($username, $apiKey);


    //     // Get the SMS service
    //     $sms = $AT->sms();

    //     // Set the parameters for sending the SMS
    //     $options = [
    //         'to' => $mobileNumber,
    //         'message' => $message,
    //         'from' => '36676', 
    //         'username' => $username, 
    //     ];

    //     try {
    //         // Send the SMS
    //         $result = $sms->send($options);

    //         // Handle the result (if needed)
    //         // $smsId = $result['SMSMessageData']['Message'][0]['Status'];

    //         return response()->json(['token' => $formattedId], 201)
    //             ->header('Access-Control-Allow-Origin', 'http://localhost:3000/')
    //             ->header('Access-Control-Allow-Methods', 'POST')
    //             ->header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
    //     } catch (ClientException $e) {
    //         // Handle exception or log the error
    //         $response = $e->getResponse();
    //         $statusCode = $response->getStatusCode();
    //         $errorMessage = $response->getBody()->getContents();

    //         return response()->json(['error' => $errorMessage], $statusCode);
    //     }
    // }

    private function sendSMS($smsApiUrl, $smsRequestBody)
    {
        $client = new Client();

        try {
            $response = $client->post($smsApiUrl, [
                'json' => $smsRequestBody,
            ]);

            $statusCode = $response->getStatusCode();
            $body = $response->getBody()->getContents();

            if ($statusCode === 200) {
                \Log::info("SMS sent successfully. Response: " . $body);
            } else {
                \Log::error("Failed to send SMS. Status code: " . $statusCode);
            }
        } catch (\Exception $e) {
            \Log::error("Exception while sending SMS: " . $e->getMessage());
        }
    }
}