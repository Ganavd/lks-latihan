import { Link, useNavigate, useParams } from "react-router-dom";
import React, { useState, useEffect } from "react";
import Cookies from "js-cookie";

export default function Index() {
  const { id } = useParams();
  const [Students, setStudent] = useState([]);
    const [pesanEror, setpesanEror] = useState("");
  const [mauLoading, setmauLoading] = useState(true);
  const navigate = useNavigate();
  const logout = () => {
    Cookies.remove("tokenSaya");
    navigate("/login");
  };

  const handleDelete = async (id) => {
      try {
        const konfirmasi = confirm("Yakin mau dihapus?");
        if (!konfirmasi) return;

        const response = await fetch(`http://localhost:8000/api/delete/${id}`, {
          method: "DELETE",
          headers: {
            "Content-Type": "application/json",
            Accept: "application/json",
            Authorization: `Bearer ${Cookies.get("tokenSaya")}`,
          },
          });
          
          const result = await response.json();
          if (response.ok) {

            setStudent(Students.filter((item => item.id !== id)))
            alert(result.message  || "Data berhasil dihapus.");
            navigate("/index");
          } else {
            setpesanEror(result.message)|| "Terjadi kesalahan saat menghapus data.";
            setmauLoading(false);
          }
        
      } catch (error) {
        console.error("Eror:", error);
        setpesanEror("Terjadi kesalahan saat terhubung ke server.");
      }
      };


  useEffect(() => {
    
    (async () => {
      try {
        const response = await fetch("http://localhost:8000/api/index", {
          headers: {
            "Content-Type": "application/json",
            Accept: "application/json",
            Authorization: `Bearer ${Cookies.get("tokenSaya")}`,
          },
        });
        if (response.status === 401) {
          logout();
          return;
        }
        const newStudent = await response.json();
        setStudent(newStudent?.data);
      } catch (error) {
        console.error("Eror:", error);
        setpesanEror("Terjadi kesalahan saat terhubung ke server.");
      } finally {
        setmauLoading(false);
      }
    })();
  }, []);

  return (
    <>
      <button onClick={logout} className="btn btn-logout">
        Logout
      </button>

      <div className="card-header">
        <h2 className="card-title">Data Siswa</h2>
        <Link to="/create" className="btn btn-primary">
          + Tambah Siswa
        </Link>
      </div>

      <div className="table-responsive">
        <table className="table-siswa">
          <thead>
            <tr>
              <th className="text-center" style={{ width: "50px" }}>
                No
              </th>
              <th style={{ width: "120px" }}>NIS</th>
              <th>Nama Lengkap</th>
              <th className="text-center" style={{ width: "60px" }}>
                L/P
              </th>
              <th style={{ width: "120px" }}>Kelas</th>
              <th>Jurusan</th>
              <th className="text-center" style={{ width: "180px" }}>
                Aksi
              </th>
            </tr>
          </thead>
          <tbody>
            {mauLoading ? (
              <tr>
                <td colSpan="7" className="text-center">
                  Memuat data ...
                </td>
              </tr>
            ) : Students?.length === 0 ? (
              <tr>
                <td colSpan="7" className="text-center">
                  Tidak ada data
                </td>
              </tr>
            ) : (
              Students?.map((students, index) => (
                <tr key={students.id}>
                  <td className="text-center">{index + 1}</td>
                  <td>{students.nis}</td>
                  <td>{students.nama}</td>
                  <td className="text-center">{students.gender}</td>
                  <td>{students.kelas}</td>
                  <td>{students.jurusan}</td>
                  <td className="text-center">
                    <div className="action-buttons">
                      <Link
                        to={`/detail/${students.id}`}
                        className="btn btn-sm btn-info"
                      >
                        Detail
                      </Link>
                      <Link
                        to={`/edit/${students.id}`}
                        className="btn btn-sm btn-warning"
                      >
                        Edit
                      </Link>
                      <div
                        className="btn btn-sm btn-danger"
                        onClick={() => handleDelete(students.id)}
                      >
                        Hapus
                      </div>
                    </div>
                  </td>
                </tr>
              ))
            )}
          </tbody>
        </table>
      </div>
    </>
  );
}
