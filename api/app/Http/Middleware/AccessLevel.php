<?php

namespace App\Http\Middleware;

use Closure;

class AccessLevelMiddleware
{
    public function handle($request, Closure $next, $requiredLevel)
    {
        $user = $request->user();

        $result =  response()->json(['error' => 'Unauthorized access.'], 403);
        
        if ($user && $user->accessLevel->id <= $requiredLevel) {
            $result = $next($request);
        }

        return $result;
    }
}
