<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    protected $fillable = [

    "nis", 
    "nama",
    "gender",
    "kelas",
    "jurusan",
    "alamat",

    ];
}
