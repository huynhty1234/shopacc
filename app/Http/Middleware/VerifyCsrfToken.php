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
       'api/auth/register',
       'api/auth/login',  // Bỏ qua CSRF token cho route login API
        'api/auth/google', // Bỏ qua CSRF cho login bằng Google
    ];
}
