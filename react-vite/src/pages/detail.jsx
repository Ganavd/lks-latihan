import { Link, useNavigate, useParams } from "react-router-dom";
import React, { useState, useEffect } from "react";
import Cookies from "js-cookie";

export default function Detail() {
  const [Students, setStudent] = useState(null);
  const [pesanEror, setpesanEror] = useState("");
  const navigate = useNavigate();
  const { id } = useParams();

  useEffect(() => {
    if (!id || id === "undefined") {
      return;
    }

    (async () => {
      try {
        const response = await fetch(`http://localhost:8000/api/index/${id}`, {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            Accept: "application/json",
            Authorization: `Bearer ${Cookies.get("tokenSaya")}`,
          },
        });
        const newStudent = await response.json();
        
        if (response.status === 401) {
          navigate("/login");
          return;
        }
        if (response.ok) {
          setStudent(newStudent?.data);
        } else {
          setpesanEror(newStudent?.message || "Gagal mengambil data");
        }
      } catch (error) {
        console.error("Eror:", error);
        setpesanEror("Terjadi kesalahan saat terhubung ke server.");
      }
    })();
  }, [id, navigate]);

  return (
    <>
      <div className="card-container card-form">
        <div className="card-header">
          <h2 className="card-title">Detail Siswa</h2>
        </div>

        {pesanEror && (
          <div
            style={{
              color: "red",
              backgroundColor: "#fee2e2",
              padding: "8px",
              marginBottom: "15px",
              fontSize: "13px",
              borderRadius: "4px",
              textAlign: "center",
            }}
          >
            {pesanEror}
          </div>
        )}

        {Students && (
          <table className="table-detail">
            <tbody>
              <tr>
                <th>NIS</th>
                <td>{Students.nis}</td>
              </tr>
              <tr>
                <th>Nama Lengkap</th>
                <td>{Students.nama}</td>
              </tr>
              <tr>
                <th>Jenis Kelamin</th>
                <td>{Students.gender === "L" ? "Laki-laki" : "Perempuan"}</td>
              </tr>
              <tr>
                <th>Kelas</th>
                <td>{Students.kelas}</td>
              </tr>
              <tr>
                <th>Jurusan</th>
                <td>{Students.jurusan}</td>
              </tr>
              <tr>
                <th>Alamat</th>
                <td>{Students.alamat}</td>
              </tr>
            </tbody>
          </table>
        )}

        <div className="form-actions">
          <Link to="/index" className="btn btn-secondary">
            Kembali
          </Link>
          <Link to={`/edit/${id}`} className="btn btn-warning">
            Edit Siswa
          </Link>
        </div>
      </div>
    </>
  );
}
