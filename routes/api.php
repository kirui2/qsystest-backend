<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\TokenController;
use App\Http\Controllers\Api\OperatorController;
use Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {return $request->user();});

// Operator Routes
Route::post('/generate-token', [TokenController::class, 'generateToken']);
Route::get('/served-by-operators', [TokenController::class, 'tokensServedByOperators']);
Route::get('/trend-analysis', [TokenController::class, 'trendAnalysis']);
Route::get('/token-comparison', [TokenController::class, 'tokenComparison']);
Route::post('/operator/login', [OperatorController::class, 'login']);
Route::get('/operator/tokens', [OperatorController::class, 'viewTokens']);
Route::get('/operator/processing-tokens', [OperatorController::class, 'viewProcessingTokens']);
Route::get('/operator/complete-tokens', [OperatorController::class, 'viewCompleteTokens']);

Route::middleware(['auth:sanctum'])->group(function () {
Route::put('/operator/complete', [OperatorController::class,'completeToken']);
Route::put('/operator/call-next', [OperatorController::class,'callNext']);
Route::post('/operator/call-next-in-queue', [OperatorController::class,'callNextInQueue']);
Route::get('/operator/active-token/{user_id}', [OperatorController::class, 'fetchTokensByUserId']);
Route::get('/operator/processing-token/{user_id}', [OperatorController::class, 'getLastTokenForUser']);
});