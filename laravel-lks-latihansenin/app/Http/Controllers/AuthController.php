<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{

    public function login(Request $request){

        $Validasi=Validator::make($request->all(), [
            "name" => "required|string|max:225",
            "password" => "required|string|max:225" ,
        ]);

        if ($Validasi->fails()){
            return response()->json([
                "success" => false,
                "message" => "Input tidak valid",
                "error" => $Validasi->errors()->toArray()             
            ], 422);
        };

        $user = User::where('name', $request->name)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                "success" => false,
                "message" => "Nama atau Password salah!"
            ], 401);
        };


        $token = $user->createToken('tokenSaya')->plainTextToken;



        return response()->json([
            "success" => true,
            "message" => "Berhasil Login",
            "token" => $token,
            "user" => $user,
            

        ],200)->cookie('tokenSaya', $token);
}

        public function register (Request $request){ 

            $Validasi = $request->validate([
                "name" => "required|string|max:225",
                "email" => "required|email||unique:users,email",
                "password" => "required|string|max:225",
            ]);

            $users = User::create([
                "name" => $Validasi['name'],
                "email" => $Validasi['email'],
                "password" => Hash::make($Validasi['password']),
                'email_verified_at' => now(),
            ]);

        $token = $users->createToken('tokenSaya')->plainTextToken;

            return response()->json([
                "success" => true,
                "message" => "Akun berhasil dibuat",
                "Data" => $users,
                "token" => $token,
            ], 200)->cookie('tokenSaya', $token);
        
        }








}
