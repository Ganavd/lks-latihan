import { Link, useNavigate } from "react-router-dom";
import { useState, useEffect } from "react";
import Cookies from "js-cookie";

export default function Login() {
  const navigate = useNavigate();

  const [pesanEror, setpesanEror] = useState("");
  const [mauLoading, setmauLoading] = useState(false);
  const [fromData, setfromData] = useState({
    name: "",
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

    if (!fromData.name || !fromData.password){
      setpesanEror("Nama dan Password wajib diisi");
      setmauLoading(false);
      return;
    }

    try {
      const response = await fetch("http://localhost:8000/api/login", {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify(fromData),
      });

      const result = await response.json();

      if (response.ok) {
        setCookies("tokenSaya", result.token);
        navigate("/index");
      } else {
        const pesanGagal =
          result.error || result.message || "Nama atau password Salah";
        setpesanEror(pesanGagal);
      }
    } catch (error) {
      console.error("Eror:", error);
      setpesanEror("Terjadi kesalahan saat login.");

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
        <h2 style={{ textAlign: "center"}}>Halaman Login</h2>
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

        <div style={{}}>
          <form onSubmit={handleSubmit}>
            <div style={{ marginBottom: "5px" }}>
              <label htmlFor="nameInput">Username</label>
              <br />
              <input
                type="text"
                id="nameInput"
                name="name"
                value={fromData.name}
                onChange={handleChange}
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
                style={{
                  width: "100%",
                  padding: "8px",
                  borderRadius: "10px",
                  border: "1px solid #ccc",
                }}
              />
            </div>
            <button style={{ width: "100%", padding: "10px" }} type="submit">
              {mauLoading ? "Memproses" : "Masuk"}
            </button>
            <Link to="/register"
            style={{ display: "block", marginTop: "15px", textAlign: "center", fontSize: "13px" }}
            >Belum Punya Akun ?</Link>          
            </form>
        </div>
      </div>
    </>
  );
}
