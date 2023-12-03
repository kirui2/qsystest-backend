<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Auth;
use App\Models\Token;
use App\Models\User;
use App\Events\AudioCallEvent;


class OperatorController extends Controller
{

public function login(Request $request)
{
    $credentials = $request->only('email', 'password');

    if (Auth::attempt($credentials)) {
        $user = Auth::user();
        $token = $user->createToken('OperatorToken', ['user_id' => $user->id])->plainTextToken;
        return response()->json([
            'token' => $token,
            'user_id' => $user->id
        ], 200);
    }

    return response()->json(['message' => 'Invalid credentials'], 401);
}

public function fetchTokensByUserId(Request $request) {
    // Retrieve user_id from the login response
    $user_id = $request->user_id;

    // Fetch tokens where token.counter matches the user_id
    $tokens = Token::where('counter', $user_id)->get();

    return response()->json(['tokens' => $tokens], 200);
}


    public function viewTokens()
    {
        $tokens = Token::where('status', 0)
            ->whereNull('counter')
            ->get();
    
        return response()->json(['tokens' => $tokens], 200);
    }

    public function getLastTokenForUser()
    {
        $userId = Auth::id(); // Retrieve the authenticated user's ID
    
        // Find the last token where counter matches the user ID
        $lastToken = Token::where('counter', $userId)
            ->orderBy('id', 'desc')
            ->first();
    
        return response()->json(['last_token' => $lastToken], 200);
    }
    

    public function viewProcessingTokens()
    {
        $tokens = Token::where('status', 0)
            ->whereNotNull('counter')
            ->get();
    
        return response()->json(['tokens' => $tokens], 200);
    }


    public function viewCompleteTokens()
    {
        $tokens = Token::where('status', 1)
            ->whereNotNull('counter')
            ->get();
    
        return response()->json(['tokens' => $tokens], 200);
    }

public function callNext(Request $request)
    {
        $userId = Auth::id();

        // Find the next token with a null counter
        $nextToken = Token::whereNull('counter')
            ->orderBy('id')
            ->first();

        if ($nextToken) {
            // Update the token's counter with the user ID
            $nextToken->counter = $userId;
            $nextToken->save();

            event(new AudioCallEvent($nextToken, $userId));
            return response()->json(['message' => 'Token called successfully'], 200);
        }

        return response()->json(['message' => 'No token available'], 400);
    }

public function completeToken(Request $request)
{
    $userId = Auth::id();

    // Find the last token belonging to the authenticated operator with status 0
    $lastToken = Token::where('counter', $userId)
        ->where('status', 0)
        ->orderByDesc('id')
        ->first();

    if ($lastToken) {
        $lastToken->status = 1;
        $lastToken->update();

        return response()->json(['message' => 'Last token marked as complete'], 200);
    }

    return response()->json(['message' => 'No eligible token found or token cannot be completed'], 400);
}

    public function callNextInQueue()
    {
        $nextToken = Token::where('status', 0)
            ->whereNull('counter')
            ->orderBy('id')
            ->first();

        if ($nextToken) {
            $nextToken->counter = Auth::id();
            $updated = $nextToken->save(); // Save the changes

            if ($updated) {
                return response()->json(['message' => 'Next token in queue called'], 200);
            } else {
                return response()->json(['message' => 'Failed to update token'], 500);
            }
        }

        return response()->json(['message' => 'No eligible tokens in the queue'], 400);
    }

   
}
