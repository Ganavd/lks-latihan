<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;
use App\Models\Student;
use Illuminate\Http\Request;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        $student = Student::all();

        return response()->json([
            "success" => true,
            "message" => 'Daftar Siswa',
            "data" => $student,

        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $ValidasiAsli = $request->validate([
            "nis" => "required|numeric|unique:students,nis",
            "nama" => "required|string|max:225",
            "gender" => "required|string|in:L,P",
            "kelas" => "required|string|max:25",
            "jurusan" => "required|string|max:225",
            "alamat" => "required|string|max:225",
        ]);

        $students = Student::create($ValidasiAsli);

        return response()->json([
            "success" => true,
            "message" => "Data Berhasil ditambahkan",
            "Data" => $students,
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $students = Student::findOrFail($id);

        return response()->json([
            "success" => true,
            "message" => "Data berhasil ditemukan",
            "data" => $students,
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $Validasi = $request->validate([
            "nis" => "required|numeric|unique:students,nis," . $id,
            "nama" => "required|string|max:225",
            "gender" => "required|string|in:L,P",
            "kelas" => "required|string|max:25",
            "jurusan" => "required|string|max:225",
            "alamat" => "required|string|max:225",
        ]);

        $student = Student::findOrFail($id);
        $student->update($Validasi);

        return response()->json([
            "success" => true,
            "message" => "Data berhasil diperbarui",
            "data" => $student,
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $student = Student::findOrFail($id);
        $student->delete();

        return response()->json([
            "success" => true,
            "data" => $student,
            "message" => "Data berhasil dihapus",
        ], 200);
    }
}
