class RecipeData {
  String namaResep;
  String waktuJadi;
  String deskripsiSingkat;
  String deskripsiPanjang;
  String sampulGambar;

  RecipeData({
    required this.namaResep,
    required this.waktuJadi,
    required this.deskripsiSingkat,
    required this.deskripsiPanjang,
    required this.sampulGambar,
  });
}

var recipeDataList = [
  RecipeData(
    namaResep: 'Patty Burger',
    waktuJadi: '10 Menit',
    deskripsiSingkat: "Patty Burger yang enak banget dan murah meriah serta bikin kenyang perut.",
    deskripsiPanjang: "Bahan-bahan:\n" +
        "• 300 gr daging giling sapi\n" +
        "• 50 gr tepung roti\n" +
        "• 1 butir telur\n" +
        "• 1 buah bawang bombay, potong kecil\n" +
        "• Daun seledri, iris tipis\n" +
        "• 1/2 sdt bawang putih bubuk\n" +
        "• 1/2 sdt pala bubuk\n" +
        "• Lada secukupnya\n" +
        "• Garam secukupnya\n" +
        "• Minyak zaitun/minyak sayur untuk memanaskan beef\n" +
        "\n" +
        "Cara membuat:\n" +
        "• Dalam wadah campurkan semua bahan, aduk rata\n" +
        "• Ambil sekitar 55 gr adonan beef atau sesuai selera, kemudian bulatkan\n" +
        "• Setelah itu bisa langsung dipanaskan di teflon atau bisa dibekukan di dalam freezer",
    sampulGambar: 'images/beef_burger.jpg',
  ),
  RecipeData(
    namaResep: 'Udang Goreng',
    waktuJadi: '10 Menit',
    deskripsiSingkat: "Udang Goreng yang enak banget dan murah meriah serta bikin kenyang perut.",
    deskripsiPanjang: "Bahan-Bahan:\n" +
        "• 300 gr udang peci, ukuran sedang\n" +
        "• 1 sdm ketumbar bubuk\n" +
        "• 1 sdm bawang putih bubuk\n" +
        "• 1 sdt garam\n" +
        "• 1/2 sdt lada putih\n" +
        "• 8 siung bawang putih, cincang\n" +
        "• Minyak sayur secukupnya\n" +
        "\n" +
        "Cara membuat:\n" +
        "• Bersihkan udang, beri perasan jeruk nipis dan potong sungutnya.\n" +
        "• Marinasi udang dengan ketumbar bubuk, bawang putih bubuk, garam dan lada bubuk selama 30 menit.\n" +
        "• Goreng udang yang sudah dimarinasi hingga kecokelatan dengan api sedang, angkat dan sisihkan.\n" +
        "• Goreng bawang putih cincang dengan minyak bekas menggoreng udang hingga harum dan kekuningan. Tiriskan.\n" +
        "• Panaskan 1 sdm minyak goreng dengan api kecil, masukkan udang dan bawang putih yang sudah digoreng tadi. Aduk hingga tercampur rata.\n" +
        "• Sajikan dengan nasi hangat.",
    sampulGambar: 'images/udang_goreng_cover.jpeg',
  ),
  RecipeData(
    namaResep: 'Mie Goreng',
    waktuJadi: '10 Menit',
    deskripsiSingkat: "Mie Goreng yang enak banget dan murah meriah serta bikin kenyang perut.",
    deskripsiPanjang: "Bahan-bahan:\n" +
        "- 1 bungkus mie telur\n" +
        "- 2 butir telur kocok lepas\n" +
        "- 1 batang daun bawang iris\n" +
        "- 100 gr sawi\n" +
        "- 100 gr kol\n" +
        "- 2 sdm kecap manis\n" +
        "- 1 sdt kecap asin\n" +
        "- 2 sdm saus tiram\n" +
        "- 1 sdm minyak wijen\n" +
        "- 3 sdm minyak goreng\n" +
        "- 1/2 sdm kaldu jamur\n" +
        "- 1/4 sdt garam\n" +
        "\n" +
        "Bumbu halus:\n" +
        "- 5 siung bawang merah\n" +
        "- 3 siung bawang putih\n" +
        "- 2 butir kemiri\n" +
        "\n" +
        "Cara membuat:\n" +
        "1. Rebus mie telur sampai lunak. Jangan terlalu lama biar nggak lembek, kemudian tiriskan.\n" +
        "2. Panaskan wajan, goreng telur kocok, buat orak arik, sisihkan di pinggir wajan.\n" +
        "3. Masukkan bumbu halus. Tumis bumbu sampai harum, masukkan semua bahan. Beri air sedikit biar bumbu meresap.\n" +
        "4. Aduk rata hingga air habis, koreksi rasa.\n" +
        "5. Sajikan dengan taburkan bawang goreng.",
    sampulGambar: 'images/mie_goreng.webp',
  ),
  RecipeData(
    namaResep: 'Pisang Goreng',
    waktuJadi: '10 Menit',
    deskripsiSingkat: "Pisang Goreng yang enak banget dan murah meriah serta bikin kenyang perut.",
    deskripsiPanjang: "Bahan-bahan:\n" +
        "- 10 buah pisang kepok, belah sebagian tidak sampai putus\n" +
        "- 5 sdm terigu\n" +
        "- 1 sdm tepung beras\n" +
        "- 1/4 sdt vanilli bubuk\n" +
        "- 1 sdm gula pasir\n" +
        "- Sejumput garam\n" +
        "- Air secukupnya\n" +
        "- Tepung panir secukupnya\n" +
        "\n" +
        "Cara membuat:\n" +
        "1. Campur terigu, tepung beras, vanili, gula pasir, dan garam. Tuang air sedikit demi sedikit, aduk rata adonan sampai dengan kekentalan yang pas. Celupkan pisang ke dalam adonan, lalu gulingkan ke tepung panir.\n" +
        "2. Panaskan minyak di dalam wajan dengan api sedang, goreng adonan pisang sampai matang kuning keemasan. Angkat dan tiriskan, pisang goreng pasir siap disajikan.\n",
    sampulGambar: 'images/pisang_goreng.jpeg',
  ),
  RecipeData(
    namaResep: 'Telur Goreng',
    waktuJadi: '10 Menit',
    deskripsiSingkat: "Telur Goreng yang enak banget dan murah meriah serta bikin kenyang perut.",
    deskripsiPanjang: "Bahan :\n" +
        "\n" +
        "- 4 butir telur ayam atau bebek\n" +
        "- 1 sdm tepung beras\n" +
        "- 2 sdm penuh daun bawang iris halus\n" +
        "- 1/2 sdt merica bubuk\n" +
        "- 1 sdt garam.\n" +
        "- 10 buah cabai rawit iris kasar\n" +
        "- 1 sdt kecap manis.\n" +
        "\n" +
        "Cara Membuat :\n" +
        "\n" +
        "1. Kocok telur hingga berbuih halus.\n" +
        "2. Tambahkan daun bawang, tepung beras, merica dan garam. Kocok hingga benar-benar rata.\n" +
        "3. Panaskan minyak banyak dalam wajan besi atau aluminium yang cekung hingga panas benar. Jika ingin rasa lebih gurih bisa saja dipakai minyak jelantah bersih. Sebaiknya gunakan wajan cekung agar bentuk dadar bundar dan tebal.\n" +
        "4. Tuangkan sebagian telur kocok, dengan mengangkat wadah agak tinggi agar bisa terbentuk 'renda' di keliling telur. Masak hingga kecokelatan dan keriting pinggirnya.\n" +
        "5. Balikkan telur dan masak hingga kedua sisinya kuning kecokelatan. Angkat dan tiriskan.\n",
    sampulGambar: 'images/telur_goreng.jpg',
  ),
  RecipeData(
    namaResep: 'Patty Burger',
    waktuJadi: '10 Menit',
    deskripsiSingkat: "Patty Burger yang enak banget dan murah meriah serta bikin kenyang perut.",
    deskripsiPanjang: "Bahan-bahan:\n" +
        "• 300 gr daging giling sapi\n" +
        "• 50 gr tepung roti\n" +
        "• 1 butir telur\n" +
        "• 1 buah bawang bombay, potong kecil\n" +
        "• Daun seledri, iris tipis\n" +
        "• 1/2 sdt bawang putih bubuk\n" +
        "• 1/2 sdt pala bubuk\n" +
        "• Lada secukupnya\n" +
        "• Garam secukupnya\n" +
        "• Minyak zaitun/minyak sayur untuk memanaskan beef\n" +
        "\n" +
        "Cara membuat:\n" +
        "• Dalam wadah campurkan semua bahan, aduk rata\n" +
        "• Ambil sekitar 55 gr adonan beef atau sesuai selera, kemudian bulatkan\n" +
        "• Setelah itu bisa langsung dipanaskan di teflon atau bisa dibekukan di dalam freezer",
    sampulGambar: 'images/beef_burger.jpg',
  ),
  RecipeData(
    namaResep: 'Udang Goreng',
    waktuJadi: '10 Menit',
    deskripsiSingkat: "Udang Goreng yang enak banget dan murah meriah serta bikin kenyang perut.",
    deskripsiPanjang: "Bahan-Bahan:\n" +
        "• 300 gr udang peci, ukuran sedang\n" +
        "• 1 sdm ketumbar bubuk\n" +
        "• 1 sdm bawang putih bubuk\n" +
        "• 1 sdt garam\n" +
        "• 1/2 sdt lada putih\n" +
        "• 8 siung bawang putih, cincang\n" +
        "• Minyak sayur secukupnya\n" +
        "\n" +
        "Cara membuat:\n" +
        "• Bersihkan udang, beri perasan jeruk nipis dan potong sungutnya.\n" +
        "• Marinasi udang dengan ketumbar bubuk, bawang putih bubuk, garam dan lada bubuk selama 30 menit.\n" +
        "• Goreng udang yang sudah dimarinasi hingga kecokelatan dengan api sedang, angkat dan sisihkan.\n" +
        "• Goreng bawang putih cincang dengan minyak bekas menggoreng udang hingga harum dan kekuningan. Tiriskan.\n" +
        "• Panaskan 1 sdm minyak goreng dengan api kecil, masukkan udang dan bawang putih yang sudah digoreng tadi. Aduk hingga tercampur rata.\n" +
        "• Sajikan dengan nasi hangat.",
    sampulGambar: 'images/udang_goreng_cover.jpeg',
  ),
  RecipeData(
    namaResep: 'Mie Goreng',
    waktuJadi: '10 Menit',
    deskripsiSingkat: "Mie Goreng yang enak banget dan murah meriah serta bikin kenyang perut.",
    deskripsiPanjang: "Bahan-bahan:\n" +
        "- 1 bungkus mie telur\n" +
        "- 2 butir telur kocok lepas\n" +
        "- 1 batang daun bawang iris\n" +
        "- 100 gr sawi\n" +
        "- 100 gr kol\n" +
        "- 2 sdm kecap manis\n" +
        "- 1 sdt kecap asin\n" +
        "- 2 sdm saus tiram\n" +
        "- 1 sdm minyak wijen\n" +
        "- 3 sdm minyak goreng\n" +
        "- 1/2 sdm kaldu jamur\n" +
        "- 1/4 sdt garam\n" +
        "\n" +
        "Bumbu halus:\n" +
        "- 5 siung bawang merah\n" +
        "- 3 siung bawang putih\n" +
        "- 2 butir kemiri\n" +
        "\n" +
        "Cara membuat:\n" +
        "1. Rebus mie telur sampai lunak. Jangan terlalu lama biar nggak lembek, kemudian tiriskan.\n" +
        "2. Panaskan wajan, goreng telur kocok, buat orak arik, sisihkan di pinggir wajan.\n" +
        "3. Masukkan bumbu halus. Tumis bumbu sampai harum, masukkan semua bahan. Beri air sedikit biar bumbu meresap.\n" +
        "4. Aduk rata hingga air habis, koreksi rasa.\n" +
        "5. Sajikan dengan taburkan bawang goreng.",
    sampulGambar: 'images/mie_goreng.webp',
  ),
  RecipeData(
    namaResep: 'Pisang Goreng',
    waktuJadi: '10 Menit',
    deskripsiSingkat: "Pisang Goreng yang enak banget dan murah meriah serta bikin kenyang perut.",
    deskripsiPanjang: "Bahan-bahan:\n" +
        "- 10 buah pisang kepok, belah sebagian tidak sampai putus\n" +
        "- 5 sdm terigu\n" +
        "- 1 sdm tepung beras\n" +
        "- 1/4 sdt vanilli bubuk\n" +
        "- 1 sdm gula pasir\n" +
        "- Sejumput garam\n" +
        "- Air secukupnya\n" +
        "- Tepung panir secukupnya\n" +
        "\n" +
        "Cara membuat:\n" +
        "1. Campur terigu, tepung beras, vanili, gula pasir, dan garam. Tuang air sedikit demi sedikit, aduk rata adonan sampai dengan kekentalan yang pas. Celupkan pisang ke dalam adonan, lalu gulingkan ke tepung panir.\n" +
        "2. Panaskan minyak di dalam wajan dengan api sedang, goreng adonan pisang sampai matang kuning keemasan. Angkat dan tiriskan, pisang goreng pasir siap disajikan.\n",
    sampulGambar: 'images/pisang_goreng.jpeg',
  ),
  RecipeData(
    namaResep: 'Telur Goreng',
    waktuJadi: '10 Menit',
    deskripsiSingkat: "Telur Goreng yang enak banget dan murah meriah serta bikin kenyang perut.",
    deskripsiPanjang: "Bahan :\n" +
        "\n" +
        "- 4 butir telur ayam atau bebek\n" +
        "- 1 sdm tepung beras\n" +
        "- 2 sdm penuh daun bawang iris halus\n" +
        "- 1/2 sdt merica bubuk\n" +
        "- 1 sdt garam.\n" +
        "- 10 buah cabai rawit iris kasar\n" +
        "- 1 sdt kecap manis.\n" +
        "\n" +
        "Cara Membuat :\n" +
        "\n" +
        "1. Kocok telur hingga berbuih halus.\n" +
        "2. Tambahkan daun bawang, tepung beras, merica dan garam. Kocok hingga benar-benar rata.\n" +
        "3. Panaskan minyak banyak dalam wajan besi atau aluminium yang cekung hingga panas benar. Jika ingin rasa lebih gurih bisa saja dipakai minyak jelantah bersih. Sebaiknya gunakan wajan cekung agar bentuk dadar bundar dan tebal.\n" +
        "4. Tuangkan sebagian telur kocok, dengan mengangkat wadah agak tinggi agar bisa terbentuk 'renda' di keliling telur. Masak hingga kecokelatan dan keriting pinggirnya.\n" +
        "5. Balikkan telur dan masak hingga kedua sisinya kuning kecokelatan. Angkat dan tiriskan.\n",
    sampulGambar: 'images/telur_goreng.jpg',
  ),
];