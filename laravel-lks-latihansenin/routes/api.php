<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\StudentController;
use Illuminate\Support\Facades\Route;

Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);


    Route::get('/index', [StudentController::class, 'index'])->middleware('auth:sanctum');
    Route::get('/index/{id}', [StudentController::class, 'show'])->middleware('auth:sanctum');
    Route::post('/create', [StudentController::class, 'store'])->middleware('auth:sanctum');
    Route::put('/update/{id}', [StudentController::class, 'update'])->middleware('auth:sanctum');
    Route::delete('/delete/{id}', [StudentController::class, 'destroy']); 
