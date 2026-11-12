-- 1. Hapus tabel jika sudah ada sebelumnya
DROP TABLE IF EXISTS students;

-- 2. Buat tabel students
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    nis VARCHAR(20) NOT NULL UNIQUE,
    nama VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL, -- 'L' untuk Laki-Laki, 'P' untuk Perempuan
    kelas VARCHAR(20) NOT NULL,
    jurusan VARCHAR(50) NOT NULL,
    alamat TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Insert 20 Baris Data Dummy Siswa
INSERT INTO students (nis, nama, gender, kelas, jurusan, alamat) VALUES
('24251001', 'Ahmad Fauzan Pratama', 'L', 'X RPL 1', 'Rekayasa Perangkat Lunak', 'Jl. Melati No. 12, Kel. Sukamaju, Bandung'),
('24251002', 'Anindya Putri Rahayu', 'P', 'X RPL 1', 'Rekayasa Perangkat Lunak', 'Komplek Permata Indah Blok C-4, Cimahi'),
('24251003', 'Bintang Arya Nugraha', 'L', 'X RPL 1', 'Rekayasa Perangkat Lunak', 'Jl. Buah Batu No. 45, Bandung'),
('24251004', 'Citra Ayu Lestari', 'P', 'X RPL 2', 'Rekayasa Perangkat Lunak', 'Jl. Setiabudhi No. 110, Bandung'),
('24251005', 'Dimas Dwi Saputra', 'L', 'X RPL 2', 'Rekayasa Perangkat Lunak', 'Jl. Sukajadi No. 78, Bandung'),
('24251006', 'Eka Nur Halimah', 'P', 'X RPL 2', 'Rekayasa Perangkat Lunak', 'Gg. Babakan No. 15, Kiaracondong, Bandung'),
('24251007', 'Fajar Ramadhan', 'L', 'X RPL 1', 'Rekayasa Perangkat Lunak', 'Jl. Pajajaran No. 23, Bandung'),
('24251008', 'Gita Permatasari', 'P', 'X RPL 2', 'Rekayasa Perangkat Lunak', 'Jl. Terusan Pasirkoja No. 91, Bandung'),
('23241045', 'Bagas Aditya Saputra', 'L', 'XI RPL 1', 'Rekayasa Perangkat Lunak', 'Jl. Dipatiukur No. 88, Kota Bandung'),
('23241046', 'Dewi Sekar Lestari', 'P', 'XI RPL 2', 'Rekayasa Perangkat Lunak', 'Jl. Cihampelas No. 102, Bandung'),
('23241047', 'Hendra Gunawan', 'L', 'XI RPL 1', 'Rekayasa Perangkat Lunak', 'Jl. Soekarno Hatta No. 450, Bandung'),
('23241048', 'Indah Kurniawati', 'P', 'XI RPL 1', 'Rekayasa Perangkat Lunak', 'Jl. Gatot Subroto No. 67, Bandung'),
('23241049', 'Joko Tri Wahyudi', 'L', 'XI RPL 2', 'Rekayasa Perangkat Lunak', 'Jl. Cibaduyut Raya No. 105, Bandung'),
('23241050', 'Kartika Mega Putri', 'P', 'XI RPL 2', 'Rekayasa Perangkat Lunak', 'Jl. Raya Cimahi No. 34, Cimahi'),
('22231012', 'Muhammad Rizky Ramadhan', 'L', 'XII RPL 1', 'Rekayasa Perangkat Lunak', 'Gg. H. Samsudin No. 5, Batununggal, Bandung'),
('22231013', 'Nabila Zahra Faradiba', 'P', 'XII RPL 1', 'Rekayasa Perangkat Lunak', 'Jl. Pasirkaliki No. 74, Sukajadi, Bandung'),
('22231014', 'Oki Pratama Yudha', 'L', 'XII RPL 2', 'Rekayasa Perangkat Lunak', 'Jl. Dago Elos No. 19, Coblong, Bandung'),
('22231015', 'Putri Wulandari', 'P', 'XII RPL 2', 'Rekayasa Perangkat Lunak', 'Jl. Terusan Buah Batu No. 17, Bojongsoang'),
('22231016', 'Rendi Septian', 'L', 'XII RPL 1', 'Rekayasa Perangkat Lunak', 'Jl. Laswi No. 80, Baleendah, Kab. Bandung'),
('22231017', 'Siti Nur Aisyah', 'P', 'XII RPL 2', 'Rekayasa Perangkat Lunak', 'Jl. Raya Cibeureum No. 152, Cimahi');
