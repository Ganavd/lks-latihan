<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CRUD Data Siswa</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

  <!-- Kontainer Tabel di Tengah Halaman -->
  <div class="card-container">
    
    <div class="card-header">
      <h2 class="card-title">Data Siswa</h2>
      <a href="create.html" class="btn btn-primary">+ Tambah Siswa</a>
    </div>

    <div class="table-responsive">
      <table class="table-siswa">
        <thead>
          <tr>
            <th class="text-center" style="width: 50px;">No</th>
            <th style="width: 120px;">NIS</th>
            <th>Nama Lengkap</th>
            <th class="text-center" style="width: 60px;">L/P</th>
            <th style="width: 120px;">Kelas</th>
            <th>Jurusan</th>
            <th class="text-center" style="width: 180px;">Aksi</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-center">1</td>
            <td>24251001</td>
            <td>Ahmad Fauzan Pratama</td>
            <td class="text-center">L</td>
            <td>X RPL 1</td>
            <td>Rekayasa Perangkat Lunak</td>
            <td class="text-center">
              <div class="action-buttons">
                <a href="detail.html" class="btn btn-sm btn-info">Detail</a>
                <a href="edit.html" class="btn btn-sm btn-warning">Edit</a>
                <div class="btn btn-sm btn-danger">Hapus</div>
              </div>
            </td>
          </tr>
          <tr>
            <td class="text-center">2</td>
            <td>24251002</td>
            <td>Anindya Putri Rahayu</td>
            <td class="text-center">P</td>
            <td>X RPL 1</td>
            <td>Rekayasa Perangkat Lunak</td>
            <td class="text-center">
              <div class="action-buttons">
                <a href="detail.html" class="btn btn-sm btn-info">Detail</a>
                <a href="edit.html" class="btn btn-sm btn-warning">Edit</a>
                <div class="btn btn-sm btn-danger">Hapus</div>
              </div>
            </td>
          </tr>
          <tr>
            <td class="text-center">3</td>
            <td>23241045</td>
            <td>Bagas Aditya Saputra</td>
            <td class="text-center">L</td>
            <td>XI RPL 1</td>
            <td>Rekayasa Perangkat Lunak</td>
            <td class="text-center">
              <div class="action-buttons">
                <a href="detail.html" class="btn btn-sm btn-info">Detail</a>
                <a href="edit.html" class="btn btn-sm btn-warning">Edit</a>
                <div class="btn btn-sm btn-danger">Hapus</div>
              </div>
            </td>
          </tr>
          <tr>
            <td class="text-center">4</td>
            <td>23241046</td>
            <td>Dewi Sekar Lestari</td>
            <td class="text-center">P</td>
            <td>XI RPL 2</td>
            <td>Rekayasa Perangkat Lunak</td>
            <td class="text-center">
              <div class="action-buttons">
                <a href="detail.html" class="btn btn-sm btn-info">Detail</a>
                <a href="edit.html" class="btn btn-sm btn-warning">Edit</a>
                <div class="btn btn-sm btn-danger">Hapus</div>
              </div>
            </td>
          </tr>
          <tr>
            <td class="text-center">5</td>
            <td>22231012</td>
            <td>Muhammad Rizky Ramadhan</td>
            <td class="text-center">L</td>
            <td>XII RPL 1</td>
            <td>Rekayasa Perangkat Lunak</td>
            <td class="text-center">
              <div class="action-buttons">
                <a href="detail.html" class="btn btn-sm btn-info">Detail</a>
                <a href="edit.html" class="btn btn-sm btn-warning">Edit</a>
                <div class="btn btn-sm btn-danger">Hapus</div>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

  </div>

</body>
</html>
