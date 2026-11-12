import { Link, useNavigate } from "react-router-dom";
import { useState, useEffect } from "react";
import Cookies from "js-cookie";

export default function Register() {
  const navigate = useNavigate();

  const [pesanEror, setpesanEror] = useState("");
  const [mauLoading, setmauLoading] = useState(false);
  const [fromData, setfromData] = useState({
    name: "",
    email: "",
    password: "",
  });

  const setCookies = (name, value) => {
   Cookies.set(name, value);
  };

  const getCookies = (name) => {
    return Cookies.get(name);
  }

  const nameToken = getCookies("tokenSaya");

  useEffect(() => {
    if (nameToken) {
      navigate("/index");
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

    if (!fromData.name || !fromData.password || !fromData.email) {
      setpesanEror("Perhatikan semua harus ke isi");
      setmauLoading(false);
      return;
    }

    try {
      const response = await fetch("http://localhost:8000/api/register", {
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
        alert("Akun berhasil dibuat!");
        navigate("/login");
      } else {
        setpesanEror(result.message || "Gagal membuat akun.");
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
      <div
        style={{
          border: "2px solid black",
          padding: "70px",
          width: "500px",
          boxSizing: "border-box",
        }}
      >
        <h2 style={{ textAlign: "center" }}>Halaman Register</h2>
        <hr />
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

        <div>
          <form onSubmit={handleSubmit}>
            <div style={{ marginBottom: "5px" }}>
              <label htmlFor="nameInput">Name</label>
              <br />
              <input
                type="text"
                id="nameInput"
                name="name"
                value={fromData.name}
                onChange={handleChange}
                autoComplete="off"
                style={{
                  width: "100%",
                  padding: "8px",
                  borderRadius: "10px",
                  border: "1px solid #ccc",
                }}
              />
            </div>
            <div style={{ marginBottom: "5px" }}>
              <label htmlFor="emailInput">Email</label>
              <br />
              <input
                type="email"
                id="emailInput"
                name="email"
                value={fromData.email}
                onChange={handleChange}
                autoComplete="off"
                style={{
                  width: "100%",
                  padding: "8px",
                  borderRadius: "10px",
                  border: "1px solid #ccc",
                }}
              />
            </div>
            <div style={{ marginBottom: "20px" }}>
              <label htmlFor="passwordInput">password</label>
              <br />
              <input
                type="password"
                id="passwordInput"
                name="password"
                value={fromData.password}
                onChange={handleChange}
                autoComplete="new-password"
                style={{
                  width: "100%",
                  padding: "8px",
                  borderRadius: "10px",
                  border: "1px solid #ccc",
                }}
              />
            </div>
            <button style={{ width: "100%", padding: "10px" }} type="submit">
              {mauLoading ? "Memproses" : "Daftar"}
            </button>
            <Link
              to="/login"
              style={{
                display: "block",
                marginTop: "15px",
                textAlign: "center",
                fontSize: "13px",
              }}
            >
              Sudah Puya Akun !
            </Link>
          </form>
        </div>
      </div>
    </>
  );
}
