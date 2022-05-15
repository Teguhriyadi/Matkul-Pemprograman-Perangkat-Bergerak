<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Http\JsonResponse;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $this->validate($request, [
            "email" => "required",
            "password" => "required"
        ]);

        $email = $request->email;
        $password = $request->password;

        $user = User::where("email", $email)->first();

        if (!$user) {
            return response()->json(["message" => "Login Gagal"], 401);
        }

        $token = bin2hex(random_bytes(40));

        $user->update([
            "token" => $token
        ]);

        return response()->json($user);
    }
}
