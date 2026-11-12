import { Link, useNavigate } from "react-router-dom";
import React, { useState, useEffect } from "react";
import Cookies from "js-cookie";

export default function Index() {
  const [pesanEror, setpesanEror] = useState("");
  const [mauLoading, setmauLoading] = useState(false);
  const navigate = useNavigate();
  const [fromData, setfromData] = useState({
    nis: "",
    nama: "",
    gender: "L",
    kelas: "",
    jurusan: "",
    alamat: "",
  });

  const getCookies = (name) => {
    return Cookies.get(name);
  };

  const nameToken = getCookies("tokenSaya");

  useEffect(() => {
    if (!nameToken) {
      navigate("/login");
    }
  }, [navigate]);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setfromData({
      ...fromData,
      [name]: value,
    });
  };

  const handleSubmit = async (e) => {
    (e.preventDefault(), setpesanEror(""), setmauLoading(true));

    if (
      !fromData.nis,
      !fromData.nama, 
      !fromData.gender, 
      !fromData.kelas,
      !fromData.jurusan, 
      !fromData.alamat 
    ) {
      setpesanEror("Perhatikan semua harus ke isi");
      setmauLoading(false);
      return;
    }

    try {
      const response = await fetch("http://localhost:8000/api/create", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: `Bearer ${nameToken}`,
        },
        body: JSON.stringify(fromData),
      });

      const result = await response.json();

      if (response.ok) {
        alert("Data siswa berhasil ditambahkan!");
        navigate("/index");
      } else {
        setpesanEror(result.message || "Gagal menyimpan data siswa.");
      }
    } catch (error) {
      console.error("Eror:", error);
      setpesanEror("Terjadi kesalahan saat menambahkan.");
    } finally {
      setmauLoading(false);
    }
  };

  return (
    <>
      <div className="card-container card-form">
        <div className="card-header">
          <h2 className="card-title">Tambah Siswa</h2>
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

        <form onSubmit={handleSubmit}>
          <div className="form-group">
            <label htmlFor="nis" className="form-label">
              NIS (Nomor Induk Siswa)
            </label>
            <input
              type="text"
              id="nis"
              name="nis"
              className="form-control"
              placeholder="Masukkan NIS siswa"
              value={fromData.nis}
              onChange={handleChange}
              
            />
          </div>

          <div className="form-group">
            <label htmlFor="nama" className="form-label">
              Nama Lengkap
            </label>
            <input
              type="text"
              id="nama"
              name="nama"
              className="form-control"
              placeholder="Masukkan nama lengkap siswa"
              value={fromData.nama}
              onChange={handleChange}
              
            />
          </div>

          <div className="form-group">
            <label className="form-label">Jenis Kelamin</label>
            <div className="form-radio-group">
              <label className="radio-inline">
                <input
                  type="radio"
                  name="gender"
                  value="L"
                  checked={fromData.gender == "L"}
                  onChange={handleChange}
                />{" "}
                Laki-Laki
              </label>
              <label className="radio-inline">
                <input
                  type="radio"
                  name="gender"
                  value="P"
                  checked={fromData.gender == "P"}
                  onChange={handleChange}
                />{" "}
                Perempuan
              </label>
            </div>
          </div>

          <div className="form-group">
            <label htmlFor="kelas" className="form-label">
              Kelas
            </label>
            <select
              id="kelas"
              name="kelas"
              className="form-control"
              value={fromData.kelas}
              onChange={handleChange}
              
            >
              <option value="">-- Pilih Kelas --</option>
              <option value="X RPL 1">X RPL 1</option>
              <option value="X RPL 2">X RPL 2</option>
              <option value="XI RPL 1">XI RPL 1</option>
              <option value="XI RPL 2">XI RPL 2</option>
              <option value="XII RPL 1">XII RPL 1</option>
              <option value="XII RPL 2">XII RPL 2</option>
            </select>
          </div>

          <div className="form-group">
            <label htmlFor="jurusan" className="form-label">
              Jurusan
            </label>
            <select
              id="jurusan"
              name="jurusan"
              className="form-control"
              value={fromData.jurusan}
              onChange={handleChange}
              
            >
              <option value="">-- Pilih Jurusan --</option>
              <option value="Rekayasa Perangkat Lunak">
                Rekayasa Perangkat Lunak
              </option>
              <option value="Teknik Komputer dan Jaringan">
                Teknik Komputer dan Jaringan
              </option>
              <option value="Desain Komunikasi Visual">
                Desain Komunikasi Visual
              </option>
            </select>
          </div>

          <div className="form-group">
            <label htmlFor="alamat" className="form-label">
              Alamat
            </label>
            <textarea
              id="alamat"
              name="alamat"
              rows="3"
              className="form-control"
              placeholder="Masukkan alamat tempat tinggal"
              value={fromData.alamat}
              onChange={handleChange}
            ></textarea>
          </div>

          <div className="form-actions">
            <Link to="/index" className="btn btn-secondary">
              Kembali
            </Link>
            <button type="submit" className="btn btn-primary">
              {mauLoading ? "Memproses" : "Simpan"}
            </button>
          </div>
        </form>
      </div>
    </>
  );
}
