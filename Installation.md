# Installation YugabyteDB in Linux

Download YugabyteDB menggunakan perintah wget berikut:

```
wget https://downloads.yugabyte.com/releases/2.21.1.0/yugabyte-2.21.1.0-b271-linux-x86_64.tar.gz
```

Extract package

```
tar xvfz yugabyte-2.21.1.0-b271-linux-x86_64.tar.gz && cd yugabyte-2.21.1.0/
```

Untuk membuat kluster lokal node tunggal dengan faktor replikasi (RF) 1, jalankan perintah berikut:

```
./bin/yugabyted start
```

Expect an output similar to the following:
+------------------------------------------------------------------------------------------------------------+
|                                                 yugabyted                                                  |
+------------------------------------------------------------------------------------------------------------+
| Status              : Running.                                                                             |
| Replication Factor  : 1                                                                                    |
| Web console         : http://10.100.13.205:7000                                                            |
| JDBC                : jdbc:postgresql://127.0.0.0:5433/yugabyte?user=yugabyte&password=yugabyte        |
| YSQL                : bin/ysqlsh -h 127.0.0.0  -U yugabyte -d yugabyte                                 |
| YCQL                : bin/ycqlsh 127.0.0.0 9042 -u cassandra                                           |
| Data Dir            : /root/var/data                                                                       |
| Log Dir             : /root/var/logs                                                                       |
| Universe UUID       : 7a238ed6-78f9-4c6d-9ba3-ff1b97c34b46                                                 |
+------------------------------------------------------------------------------------------------------------+

## Connect to the database

### Pertama connect Yugabyte dengan : 

```
ysqlsh -h 127.0.0.0  -U yugabyte -d yugabyte
```

![YSQL](https://github.com/user-attachments/assets/1967c661-23d8-4143-a13c-c32a275d2e86)

### Kedua connect dengan Dbeaver : 

![Dbeaver](https://github.com/user-attachments/assets/f4490a84-13e1-43a3-a323-fad56050726e)



