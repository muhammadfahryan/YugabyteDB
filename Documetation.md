# YugaByte
YugabyteDB adalah database SQL terdistribusi berkinerja tinggi untuk mendukung aplikasi global berskala internet. Dibangun menggunakan kombinasi penyimpanan high-performance document store, per-shard distributed consensus replication, and multi-shard ACID transactions

YugabyteDB melayani beban kerja RDBMS skala luas dan OLTP skala internet dengan latensi kueri rendah, ketahanan ekstrem terhadap kegagalan, dan distribusi data global. Sebagai database berbasis cloud, database ini dapat digunakan di seluruh cloud publik dan privat serta di lingkungan Kubernetes.

YugabyteDB sangat cocok untuk aplikasi berbasis cloud yang berkembang pesat yang perlu melayani data penting bagi bisnis dengan andal, tanpa kehilangan data, ketersediaan tinggi, dan latensi rendah.

## Apa perbedaan nya dengan Postgresql
PostgreSQL itu database relasional single-node (RDBMS). Semua data disimpan dan disajikan dari satu node aja. Di sini, tabel nggak di-shard (dipartisi secara horizontal) jadi komponen lebih kecil karena semua data di-handle oleh satu node. Di sisi lain, YugabyteDB itu database distribusi auto-sharded di mana shard secara otomatis ditempatkan di node-node berbeda. Keuntungannya adalah nggak ada satu node yang bisa jadi bottleneck performa atau ketersediaan saat melayani data dari shard yang berbeda. Konsep ini kunci buat YugabyteDB mencapai horizontal write scalability yang nggak ada di PostgreSQL. Tambahan node menyebabkan shard di-rebalance ke semua node sehingga kapasitas komputasi tambahan bisa lebih maksimal dipakai.

PostgreSQL punya konsep "partitioned tables" yang bisa bikin pengembang PostgreSQL bingung soal sharding. Partitioned tables ini pertama kali diperkenalkan di PostgreSQL 10, memungkinkan satu tabel dipecah jadi beberapa tabel anak, jadi tabel-tabel anak ini bisa disimpan di disk terpisah (tablespaces). Tapi, penyajian data masih tetap dilakukan oleh satu node. Makanya, pendekatan ini nggak menawarkan manfaat dari database distribusi auto-sharded seperti YugabyteDB.

### PostgreSQL vs. YugabyteDB
Arsitektur dan Skalabilitas:

    PostgreSQL:
        Single-node RDBMS (relational database).
        Tabel nggak di-shard, semua data di-handle oleh satu node.
    YugabyteDB:
        Database distribusi auto-sharded.
        Shard secara otomatis tersebar di berbagai node.
        Nggak ada bottleneck pada satu node, memberikan horizontal write scalability.

Partitioned Tables di PostgreSQL:

    PostgreSQL:
        Diperkenalkan di PostgreSQL 10.
        Tabel dipecah jadi beberapa tabel anak yang bisa disimpan di disk terpisah.
        Masih dijalankan dari satu node, jadi nggak dapat manfaat auto-sharding.
    YugabyteDB:
        Memiliki auto-sharding bawaan yang mendistribusikan data secara otomatis.

Ketersediaan Berkelanjutan (Continuous Availability):

    PostgreSQL:
       - Replikasi asynchronous umum digunakan.
       - Leader-follower setup: follower menerima data yang di-commit dari master.
       - Kelemahan: kehilangan ketersediaan saat failover manual, dan data yang baru di-commit nggak bisa diakses jika master gagal.
    YugabyteDB:
       - Dirancang untuk high availability.
       - Menggunakan Raft replication protocol untuk auto-failover dan self-healing.
       - Nggak ada "leader" utama; shard leader tersebar di beberapa node.

Replikasi dan Konsistensi:

    PostgreSQL:
       - Replikasi synchronous tersedia tapi jarang digunakan karena risiko kehilangan ketersediaan.
       - Nggak bisa menjamin always-on, strongly-consistent reads.
    YugabyteDB:
       - Menggunakan leader-leases untuk menghindari serving data yang basi.
       - Menyajikan strongly consistent reads langsung dari shard leader tanpa quorum.

Transaksi ACID Terdistribusi:

    PostgreSQL:
       - Database single-shard, hanya mendukung transaksi single row dan single shard.
       - Transaksi multi-shard nggak berlaku.
    YugabyteDB:
       - Mendukung transaksi single row/shard dan multi-shard.
       - Terinspirasi dari Google Spanner untuk distributed ACID transactions dengan performa tinggi.

## Apa itu ACID ?

- Merupakan compliance(kepatuhan) untuk sistem basis data yang memiliki karakter Atomicity, Consistency, Isolation, Durability
- Sekumpulan Properti transaksi basis data yang dimaksudkan menjamin validitas data meskipun ada kesalahan atau error lainnya.

### Atomicity
- setiap statement transaksi diperlukan sebagai kesatuan
- jika transaksi berhasil, maka seluruh statement harus berhasil begitu juga sebaliknya
- properti ini untuk mencegah terjadinya kehilangan atau kerusakan data, misal jika ditengah transaksi terjadi kegagalan transaksi

### Consistency

- Memastikan transaksi hanya bisa mengubah data dari satu kondisi konsisten ke kondisi konsisten lainnya
- setiap data yang ditulis di database harus valid sesuai dengan aturan yang ditetapkan
- Hal ini mencegah data data yang menjadi tidak konsisten, menjamin integritas relasi antar data
- misal buat tabel buat constraint atau unique semua harus konsisten

### Isolation

- Transaksi sering dieksekusi secara bersamaan (misal beberapa transaksi read and write ke tabel dalam waktu yang sama
- Isolasi memastikan bahwa eksekusi secara bersamaan meninggalkan database dalam keadaan yang sama yang akan diperoleh jika transaksi dieksekusi secara berurutan(misal., ada satu data yang diakses sama 100 orang seharusnya walaupun secara bersamaan database nya memproses satu2 untuk data yang sama tersebut agar tidak terjadi crash condition)
- tujuan utama adalah kontrol konkuresi(beberapa proses langsung berjalan), terpisah antar transaksi

### Durability

- Menjamin bahwa sekali transaksi telah disimpan, itu akan tetap disimpan bahkan dalam kasus kegagalan sistem (misal, crash atau matilampu)
        
[Document Yuga Byte](https://docs.yugabyte.com/preview/faq/comparisons/postgresql/)


