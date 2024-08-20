-- Buat table transaksi
CREATE TABLE transaksi (
    id SERIAL PRIMARY KEY,
    tanggal DATE NOT NULL,
    jumlah NUMERIC(10, 2) NOT NULL,
    keterangan TEXT
);

-- Masukkan data contoh
INSERT INTO transaksi (tanggal, jumlah, keterangan) VALUES
('2024-08-20', 1500.00, 'Pembelian barang'),
('2024-08-21', 2500.50, 'Jual barang');

-- Tampilkan data
SELECT * FROM transaksi;
