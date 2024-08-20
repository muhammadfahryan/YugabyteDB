# YugaByte
YugabyteDB adalah database SQL terdistribusi berkinerja tinggi untuk mendukung aplikasi global berskala internet. Dibangun menggunakan kombinasi penyimpanan high-performance document store, per-shard distributed consensus replication, and multi-shard ACID transactions

YugabyteDB melayani beban kerja RDBMS skala luas dan OLTP skala internet dengan latensi kueri rendah, ketahanan ekstrem terhadap kegagalan, dan distribusi data global. Sebagai database berbasis cloud, database ini dapat digunakan di seluruh cloud publik dan privat serta di lingkungan Kubernetes.

YugabyteDB sangat cocok untuk aplikasi berbasis cloud yang berkembang pesat yang perlu melayani data penting bagi bisnis dengan andal, tanpa kehilangan data, ketersediaan tinggi, dan latensi rendah.

## Apa perbedaan nya dengan Postgresql
PostgreSQL itu database relasional single-node (RDBMS). Semua data disimpan dan disajikan dari satu node aja. Di sini, tabel nggak di-shard (dipartisi secara horizontal) jadi komponen lebih kecil karena semua data di-handle oleh satu node. Di sisi lain, YugabyteDB itu database distribusi auto-sharded di mana shard secara otomatis ditempatkan di node-node berbeda. Keuntungannya adalah nggak ada satu node yang bisa jadi bottleneck performa atau ketersediaan saat melayani data dari shard yang berbeda. Konsep ini kunci buat YugabyteDB mencapai horizontal write scalability yang nggak ada di PostgreSQL. Tambahan node menyebabkan shard di-rebalance ke semua node sehingga kapasitas komputasi tambahan bisa lebih maksimal dipakai.

PostgreSQL punya konsep "partitioned tables" yang bisa bikin pengembang PostgreSQL bingung soal sharding. Partitioned tables ini pertama kali diperkenalkan di PostgreSQL 10, memungkinkan satu tabel dipecah jadi beberapa tabel anak, jadi tabel-tabel anak ini bisa disimpan di disk terpisah (tablespaces). Tapi, penyajian data masih tetap dilakukan oleh satu node. Makanya, pendekatan ini nggak menawarkan manfaat dari database distribusi auto-sharded seperti YugabyteDB.
[Doc Yuga Byte](https://docs.yugabyte.com/preview/faq/comparisons/postgresql/)


