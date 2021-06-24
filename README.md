
# Project_PSBO
Nama Sistem : **GoFind**<br />
Paralel Praktikum : **P1**<br />
Nomor Kelompok : **03**<br />

<table align="center">
    <thead>
        <tr>
            <th align="center"><a href="#deskripsi-aplikasi">Deskripsi</a></th>
            <th align="center"><a href="#analisis-pengguna">Analisis Pengguna</a></th>
            <th align="center"><a href="#spesifikasi-teknis-lingkungan-pengembangan">Lingkungan</a></th>
            <th align="center"><a href="#konsep-oop-yang-digunakan">Konsep OOP</a></th>
            <th align="center"><a href="#tipe-desain-pengembangan-yang-digunakan-patternanti-pattern">Tipe Desain</a></th>
            <th align="center"><a href="#hasil-dan-pembahasan">Pembahasan</a></th>
            <th align="center"><a href="#hasil-implementasi">Implementasi</a></th>
            <th align="center"><a href="#saran-untuk-pengembangan-selanjutnya">Saran</a></th>
            <th align="center"><a href="#developer-dan-job-description">Developer</a></th>
        </tr>
    </thead>
</table align="center">

## ✏️Deskripsi Aplikasi 
Aplikasi **GoFind** merupakan aplikasi yang digunakan untuk mencari projek ataupun anggota tim untuk projeknya. Berawal dari kebutuhan mahasiswa khususnya mahasiswa IPB yang kesulitan untuk mencari partner dalam menjalankan projeknya. selain itu terdapat mahasiswa yang juga kesulitan mencari proyek yang sesuai untuk pengembangan dirinya. melalui aplikasi ini, diharapkan banyak mahasiswa terbantu untuk mencari dan mendapatkan projek atau partner tim yang sesuai dengan keinginannya masing-masing.

Pada aplikasi ini, user bisa memperlihatkan track record serta keahlian yang mereka miliki untuk bisa ikut dalam sebuah proyek nyata. Selain itu, user juga bisa memasukan media sosial dan CV sehingga user lain bisa langsung melihat social media dan CV-nya secara langsung. User juga bisa membuat projek dengan memasukan judul, deskripsi, waktu pembukaan lowongan projek, dan foto untuk memperlihatkan informasi lengkap proyek. Selanjutnya, user juga bisa memilih orang yang sesuai dengan kriteria yang diinginkan untuk menjadi anggota tim projeknya dengan cara melihat role, specialist, social media, cv serta track record dari orang tersebut. User bisa membuat atau mengikuti proyek apapun tanpa terpaku dengan jurusan atau departemen tertentu. Namun user hanya dapat berada dalam satu projek dalam satu waktu. Dengan adanya solusi tersebut, diharapkan user dapat meningkatkan kualitas kemampuannya dan memperbanyak pengalaman mereka.

## 📔Analisis Pengguna
### 👫***User Story***
1. Sebagai Mahasiswa IPB yang sedang mencari rekan untuk mengikuti lomba/projek, saya ingin menemukan partner yang sesuai dengan keahlian yang saya butuhkan untuk membantu saya dalam mengerjakan proyek.
2. Sebagai Mahasiswa IPB yang memiliki keahlian yang ingin disalurkan, saya ingin menemukan lomba atau projek nyata yang cocok dengan keahlian yang saya miliki saat ini.

## 💻Spesifikasi Teknis Lingkungan Pengembangan
### 📁Software
![software pengembangan GoFind](https://scontent-sin6-2.xx.fbcdn.net/v/t1.15752-9/192647828_350186593197721_8066950454003592681_n.png?_nc_cat=103&ccb=1-3&_nc_sid=ae9488&_nc_eui2=AeGPTj6WD-XV0RKsPUJMasCGflueE4t0Zox-W54Ti3RmjN9r6CIfGDZwGMP0VwrIFcGp4dxjWdmoaDVaj6lGe7ds&_nc_ohc=-a1SxhVI6aIAX8BoG24&_nc_ht=scontent-sin6-2.xx&oh=3fe1a5df7e2c008ef12b0db9730b4c9c&oe=60DBF9B2)

### 📱Hardware
-   **Nama :**  Samsung Galaxy A11
-   **Berat :** 177 gram (g)
-   **Material :**  Depan kaca, bingkai dan belakang plastik
-   **Jenis dan Ukuran Layar :** PLS IPS dan 6,4 inci (~81.6% rasio layar ke bodi)
-   **Resolusi Layar :** 720 x 1.560 piksel, 19.5:9 ratio (~268 piksel per inci)
-   **Chipset :**  Qualcomm Snapdragon 450 (11 nm)
-   **CPU :**  Octa-core 1.8 GHz Cortex-A53
-   **GPU :**  Adreno 506
-   **RAM :** 3 GB
-   **Memori Internal :**  64 GB
-   **Kamera Belakang :**  13 MP (f/1.8, 27mm wide, AF) + 5 MP (f/2.2, 115˚ ultrawide) +  
    2 MP (f/2.4, depth)
-   **Kamera Depan :** 8 MP, f/2.0
-   **Bluetooth :** 4.2, A2DP, LE
-   **Sensor :** Sidik jari (di belakang),  _accelerometer, proximity_
-   **Baterai :**  Li-Po 4000 mAh, non-removable, Fast charging 15W

### 💾TechStack
Aplikasi **GoFind** adalah aplikasi yang berbasis Mobile yang dibuat menggunakan framework Flutter SDK (_Software Development Kit_) yang dikembangkan oleh Google untuk membuat aplikasi yang bagus dan bisa berjalan pada berbagai platform. Backend untuk aplikasi ini menggunakan MongoDB, Express, ODM Mongoose, dan Thunder Client.

**Framework Frontend** : Flutter SDK<br />
**Framework Backend** : MongoDB, Express, ODM Mongoose, dan Thunder Client<br />
**Output** : Mobile Application<br />

## 🔑Konsep OOP yang Digunakan
* #### Encapsulation
Encapsulation adalah membungkus class dan menjaga apa apa saja yang ada di dalam class tersebut, baik method ataupun atribut, agar tidak dapat di akses oleh class lainnya. Untuk menjaga hal tersebut dalam Encapsulation dikenal nama Hak Akses Modifier yang terdiri dari : Public, Private, dan Protected.
* #### Inheritance
Inheritance adalah konsep OOP dimana sebuah class dapat menurunkan property dan method yang dimilikinya kepada class lain. Konsep inheritance dipakai untuk memanfaatkan fitur code reuse, yakni menghindari terjadinya duplikasi kode program.
* #### Abstraction
Abstraction adalah proses untuk menyembunyikan detail implementasi dari user sehingga hanya sisi fungsionalitas saja yang ditampilkan, atau dengan kata lain user akan menerima informasi mengenai apa yang dapat dilakukan oleh suatu objek namun user tidak akan mengetahui bagaimana objek itu melakukannya.

## 🎨Tipe Desain Pengembangan yang Digunakan (Pattern/Anti Pattern)
Tipe desain pengembangan yang digunakan adalah metode waterfall. Pengembangan sistem aplikasi dengan metode waterfall yang terdiri dari tahap _Requirement, Design System, Coding, Integration_, dan _Operation and Maintenance_. Disebut sebagai metode waterfall dikarenakan tahapan dan juga urutan dari metode yang dilakukan merupakan jenis metode yang berurutan dan berkelanjutan, seperti layaknya sebuah air terjun.

Kelebihan dari metode Waterfall adalah :
1.  Memiliki proses yang terurut
2.  Proses yang dilakukan tidak tumpah tindih
3.  Setiap proses memiliki spesifikasinya sendiri, sehingga sebuah sistem dapat dikembangkan sesuai dengan apa yang dikehendaki.

Metode pengembangan waterfall memiliki beberapa tahapan yang berurut yaitu:

**1.  Requirement Analysis**

Tahap dimana kita harus memahami perangkat lunak yang diharapkan oleh pengguna dan batasan software yang ingin kita rancang Informasi ini biasanya dapat diperoleh melalui wawancara, diskusi atau survei langsung. Informasi dianalisis untuk mendapatkan data yang dibutuhkan oleh pengguna.

**2.  Design System**

Proses desain akan diterjemahkan syarat kebutuhan ke sebuah perancangan perangkat lunak yang dapat diperkirakan sebelum dibuat koding. Proses ini berfokus pada struktur data, rancangan perangkat lunak, representasi interface, dan detail (algoritma) prosedural. Tahapan ini akan dihasilkan dokumen yang disebut software requirement. Dokumen inilah yang akan digunakan untuk melakukan aktivitas pembuatan sistemnya.

**3.  Coding**

Coding merupakan penerjemahan desain dalam bahasa yang dapat dikenali oleh komputer. Tahapan ini merupakan tahapan nyata dalam mengerjakan suatu sistem. Setelah pengkodean selesai selanjutnya akan dilakukan testing terhadap sistem yang telah dibuat tadi. Testing dilakukan bertujuan menemukan kesalahan-kesalahan terhadap sistem tersebut kemudian dapat dilakukannya sebuah perbaikan.

**4.  Integration**

Tahapan penetapan dapat dikatakan sebagai tahap final dalam pembuatan suatu sistem. Setelah dilakukan tiga tahap metode sebelumnya, sistem ini siap digunakan oleh user.

**5.  Operation & Maintenance**

Sistem perangkat lunak yang sudah diintegrasikan kepada user, tentunya akan mengalami perubahan. Perubahan tersebut terjadi sebab sistem dapat mengalami kesalahan dan harus menyesuaikan dengan lingkungan baru. Perubahan dapat juga terjadi terhadap sistem yang disebabkan oleh kebutuhan pelanggan akan perkembangan fungsional.


## 📈Hasil dan Pembahasan

### Use case diagram
![Use Case Diagram](https://scontent-sin6-3.xx.fbcdn.net/v/t1.15752-9/190739721_500564834426213_8908409490674910310_n.png?_nc_cat=106&ccb=1-3&_nc_sid=ae9488&_nc_eui2=AeG1b7Ol2W72ozxDSQdW0s43B8GS4hoal00HwZLiGhqXTaAzrLjC4f_FrAV_SgHMV46s2O0WihfEqCItYGyBdC-B&_nc_ohc=2zKuDMgqUJwAX_y2jNv&_nc_ht=scontent-sin6-3.xx&oh=05c9da7e3ee4d6872ba971d345768edc&oe=60DA8E0D)
### Activity diagram
![Activity Diagram 1](https://scontent-sin6-1.xx.fbcdn.net/v/t1.15752-9/191771040_165196392231468_6306552687355517317_n.png?_nc_cat=101&ccb=1-3&_nc_sid=ae9488&_nc_eui2=AeFxPFSVLdFh6Yb4CMCa0Uku7Lvx6QaX-irsu_HpBpf6KnV8L_9bOCYz-ApLglTJPlYC7eDm4De2Gmj0t303M_GM&_nc_ohc=zvt8I284Cd4AX-tr5T1&tn=xAo5jjmYoiaU7dPL&_nc_ht=scontent-sin6-1.xx&oh=6e073fcb7c73c4aafe95f0a774b188b4&oe=60DACACA)
![Activity Diagram 2](https://scontent-sin6-1.xx.fbcdn.net/v/t1.15752-9/191768009_384165572970675_1360656015580899056_n.png?_nc_cat=100&ccb=1-3&_nc_sid=ae9488&_nc_eui2=AeHqVJWEqKOBYHvhNXXu1w9rTR-lEaIYPM9NH6URohg8zxyu6Xn1MNxdDmbMu4KUIdImIzn_w_tzam1aYopKTn0A&_nc_ohc=GSz2xmmlaOMAX9zOr0o&_nc_ht=scontent-sin6-1.xx&oh=1f62cf4fda52935127020200f128fd07&oe=60DB875D)
![Activity Diagram 3](https://scontent-sin6-1.xx.fbcdn.net/v/t1.15752-9/190984691_771870333522544_2577144138558800129_n.png?_nc_cat=111&ccb=1-3&_nc_sid=ae9488&_nc_eui2=AeH7DO2i9dTRmzhbwuQoZFaL3930kDQtmH3f3fSQNC2YfVhE4TXbgjMhSnPFuwqxPUZJFQB4Eo1BHoD2A5I-yDNm&_nc_ohc=YXOboZmedFQAX8IbPJ8&_nc_ht=scontent-sin6-1.xx&oh=159096a4fbe0652cdb32bb1ab5d4874b&oe=60DA3AEA)
### Class diagram
![Class Diagram](https://scontent-sin6-1.xx.fbcdn.net/v/t1.15752-9/191351829_144046597718112_8409705003102667686_n.png?_nc_cat=100&ccb=1-3&_nc_sid=ae9488&_nc_eui2=AeHOWFQO9nhi7AI_zn0V83Yqu0GVJTWEQkC7QZUlNYRCQO92TK1nAzWfeQPrZOkpZu9XhI1FffQwzslYO8Wg_jwo&_nc_ohc=qrK1M6EpCXQAX__BAcN&_nc_ht=scontent-sin6-1.xx&oh=024045a485279932aca5c0fa87c04053&oe=60D9FA80)
### Entity Relationship Diagram
![ERD](https://scontent.fcgk18-2.fna.fbcdn.net/v/t1.15752-9/197460782_4325891917445414_6553478069443013236_n.png?_nc_cat=110&ccb=1-3&_nc_sid=ae9488&_nc_eui2=AeGmm5Lvgb6u9hWxF5IOpzBk8HdZKf8awAfwd1kp_xrAB_S5bw20Ap9ATuG5olgpiio5DnM1zA5DVCNRw2ecpgEi&_nc_ohc=HeUQfZGySNgAX8ph8I2&tn=xAo5jjmYoiaU7dPL&_nc_ht=scontent.fcgk18-2.fna&oh=3dc648675ed6f71839af8d826231ee69&oe=60E6C83E)
### Arsitektur sistem
![Arsitektur Sistem](https://scontent.fcgk8-1.fna.fbcdn.net/v/t1.15752-9/200212655_234929138098479_9048520659434407682_n.png?_nc_cat=111&ccb=1-3&_nc_sid=ae9488&_nc_eui2=AeE_OetGLT2ADZxa05fySTvt64jbcsuHyvXriNtyy4fK9Ye1BkbCfaSnEyUCp2jiedSCbLvH_xaVtYxJHm7Ev-MR&_nc_ohc=jfCUirUAtzcAX-MCRdC&tn=xAo5jjmYoiaU7dPL&_nc_ht=scontent.fcgk8-1.fna&oh=5d1b72c5e5e7458f1079cf64f6ba49df&oe=60CE0177)

### Fungsi utama yang dikembangkan
Fungsi utama yang dikembangkan adalah pembuatan projek yang dibuat oleh pengguna yang berperan sebagai _Project Manager_ dan Projek tersebut dapat diikuti oleh pengguna lain yang sedang mencari projek. 

### Fungsi CRUD
1. ***Create Project*** : Pengguna dapat membuat project dengan atribut nama, deskripsi, estimated time dan project photos. Untuk Project Manager akan menggunakan ID User yang sudah membuat Project
2. ***Read Projet***    : Pengguna dapat melihat project pengguna lain dan project yang sudah dia buat pada halaman utaan
3. ***Update Project*** : Pengguna yang merupkana Project Manager dapat memperbarui atribut project nama, deskripsi dan estimated time selama project member belum di rekrut.
4. ***Delete Project*** : Pengguna yang merupakan Project Manager dapat menghapus projeect selama project member belum di rekrut. 


## Hasil Implementasi
### Screenshot sistem
![Implementasi Sistem](https://scontent.fcgk18-2.fna.fbcdn.net/v/t1.15752-9/p2048x2048/199722182_954367632023641_7813126662179533781_n.png?_nc_cat=107&ccb=1-3&_nc_sid=ae9488&_nc_eui2=AeGGkt8kSyv2qwrw2Trcxn3vOjNFImoHrm46M0UiageubvsfGYTC-eEvscl-iqU6QO-FkkwsWriaNc7x748GVZAa&_nc_ohc=Pbd0Ot7pxaAAX8aQtZA&_nc_ht=scontent.fcgk18-2.fna&tp=30&oh=65947a31cc9efa1b6bc7ae725c2f2b92&oe=60CD1ABD)

### Link Aplikasi
https://github.com/AnzeHabibi/Project_PSBO

## ❔Saran untuk Pengembangan Selanjutnya
Pengembangan selanjutnya akan dilakukan _maintenance_ sistem yang telah dibuat dan akan dievaluasi apakah sistem sudah berjalan sesuai kebutuhan pengguna atau belum. Jika belum memenuhi kebutuhan pengguna, sistem akan diperbaiki dan ditingkatkan pada bagian yang kurang. Namun jika sudah memenuhi kebutuhan pengguna, akan dibuat fitur baru yang bisa menambah kinerja sistem tersebut.

## Developer dan Job Description
|No.|Nama|Job description|
|--|--|--|
|1.|**Muhammad Abiyyu Habibi** (G64180066)|_Frontend Developer_ dan _UI/UX Designer_|
|2.|**Muhammad Fauzan Ramadhan** (G64180117)|_Project Manager_ dan _Frontend Developer_|
|3.|**Reza Achmad Naufal** (G64180078)|_Backend Developer_|
|4.|**Mohammad Thareeq Izzulhaq** (G64180041)|_Backend Developer_|
|5.|**Muhammad Hafiduddin** (G64180017)|_Frontend Developer_|
