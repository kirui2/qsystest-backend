<?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
     * The URIs that should be excluded from CSRF verification.
     *
     * @var array<int, string>
     */
    protected $except = [
        '/api/generate-token',
        '/api/operator/login',
        '/api/operator/tokens',
        '/api/operator/call-next',
        '/api/operator/complete',
        '/api/operator/call-next-in-queue',
        '/api/operator/processing-tokens',
        '/api/served-by-operators',
        '/api/trend-analysis',
        '/api/token-comparison'
        //
    ];
}
