<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Data Siswa</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

  <!-- Kontainer Form di Tengah Halaman -->
  <div class="card-container card-form">
    
    <div class="card-header">
      <h2 class="card-title">Edit Siswa</h2>
    </div>

    <form action="index.html" method="GET">
      
      <div class="form-group">
        <label for="nis" class="form-label">NIS (Nomor Induk Siswa)</label>
        <input type="text" id="nis" name="nis" class="form-control" value="24251001" required>
      </div>

      <div class="form-group">
        <label for="nama" class="form-label">Nama Lengkap</label>
        <input type="text" id="nama" name="nama" class="form-control" value="Ahmad Fauzan Pratama" required>
      </div>

      <div class="form-group">
        <label class="form-label">Jenis Kelamin</label>
        <div class="form-radio-group">
          <label class="radio-inline">
            <input type="radio" name="gender" value="L" checked> Laki-Laki
          </label>
          <label class="radio-inline">
            <input type="radio" name="gender" value="P"> Perempuan
          </label>
        </div>
      </div>

      <div class="form-group">
        <label for="kelas" class="form-label">Kelas</label>
        <select id="kelas" name="kelas" class="form-control" required>
          <option value="X RPL 1" selected>X RPL 1</option>
          <option value="X RPL 2">X RPL 2</option>
          <option value="XI RPL 1">XI RPL 1</option>
          <option value="XI RPL 2">XI RPL 2</option>
          <option value="XII RPL 1">XII RPL 1</option>
          <option value="XII RPL 2">XII RPL 2</option>
        </select>
      </div>

      <div class="form-group">
        <label for="jurusan" class="form-label">Jurusan</label>
        <select id="jurusan" name="jurusan" class="form-control" required>
          <option value="Rekayasa Perangkat Lunak" selected>Rekayasa Perangkat Lunak</option>
          <option value="Teknik Komputer dan Jaringan">Teknik Komputer dan Jaringan</option>
          <option value="Desain Komunikasi Visual">Desain Komunikasi Visual</option>
        </select>
      </div>

      <div class="form-group">
        <label for="alamat" class="form-label">Alamat</label>
        <textarea id="alamat" name="alamat" rows="3" class="form-control">Jl. Melati No. 12, Kel. Sukamaju, Bandung</textarea>
      </div>

      <div class="form-actions">
        <a href="index.html" class="btn btn-secondary">Kembali</a>
        <button type="submit" class="btn btn-warning">Update</button>
      </div>

    </form>

  </div>

</body>
</html>
