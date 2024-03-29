import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_kipas/models/card_model.dart';
import 'package:si_kipas/models/fasilitas_model.dart';

class DataModel extends ChangeNotifier {
  final List<ModelCard> _cards = [
    ModelCard(
      image: 'images/pantaicacorok.png',
      panggilanLokasi: 'Painan',
      title: 'Pantai Carocok Painan',
      mapLink: 'https://maps.app.goo.gl/trwr6QMxHRhkPLxx7',
      deskripsi:
          'Salah satu kawasan pantai yang terkenal di daerah pesisir selatan. Pantai carocok ini juga terkenal karena masjidnya yang biasa dikenal dengan masjid terapung dan juga banyak disuguhi dengan permainan anak-anak.',
      kategori: [Kategori.view, Kategori.sejarah, Kategori.populer],
      jam: '07.00-21.00',
      fasilitas: [
        Fasilitas.masjid,
        Fasilitas.tokoOlehOleh,
        Fasilitas.toilet,
      ],
    ),
    ModelCard(
      image: 'images/jembatanakar.png',
      panggilanLokasi: 'Bayang',
      title: 'Jembatan Akar',
      mapLink: 'https://maps.app.goo.gl/dHsZhz1JMs7sSvW18',
      deskripsi:
          'Jembatan akar ini cocok dijadikan tempat rekreaksi keluarga. Dua buah akar pohon beringin yang menjadi satu membuat jembatan ini sangat unik dan memanjakan mata bagi yang melihatnya.',
      kategori: [Kategori.view],
      jam: '08.00-18.00',
      fasilitas: [
        Fasilitas.toilet,
        Fasilitas.makan,
      ],
    ),
    ModelCard(
      image: 'images/kawasanmandeh.png',
      panggilanLokasi: 'Tarusan',
      title: 'Kawasan Mandeh',
      mapLink: 'https://maps.app.goo.gl/zwqWLvmmvUNNyRpt7',
      deskripsi:
          'Gugusan pulau kecil dengan air laut yang jernih, alam yang terjaga memanjakan mata kita selama berada di sini. Banyak yang bilang tempat ini merupakan Raja Ampat-nya Sumbar.',
      kategori: [Kategori.view, Kategori.populer],
      fasilitas: [
        Fasilitas.toilet,
      ],
    ),
    ModelCard(
      image: 'images/pantaisumedang.png',
      panggilanLokasi: 'Sumedang',
      title: 'Taman Wisata Sumedang',
      mapLink: 'https://maps.app.goo.gl/EoLp7s9UwQm9NNV87',
      deskripsi:
          'Suasana yang nyaman dan asri yang mengingatkan kita dengan kampung halaman. Di pantai ini kita disuguhi dengan banyak pohon rindang yang menambah indah suasanya sehingga cocok dijadikan tempat rekreasi keluarga, dimana kita bisa saling bertukar cerita sambil melihat indahnya pantai ini.',
      kategori: [Kategori.view],
      jam: '06.45-18.00',
      fasilitas: [
        Fasilitas.toilet,
        Fasilitas.tokoOlehOleh,
      ],
    ),
    ModelCard(
      image: 'images/bukitlangkisau.png',
      panggilanLokasi: 'Painan',
      title: 'Bukit Langkisau',
      mapLink: 'https://maps.app.goo.gl/r8Xqj68MAs5Pn9eV6',
      deskripsi:
          'Tempat peluncuran paralayang yang memiliki pemandangan indah ke kota Painan dan lautan. Tempat ini sangat cocok untuk para penikmat sunset.',
      jam: '24 Jam',
      kategori: [Kategori.view],
      fasilitas: [
        Fasilitas.toilet,
      ],
    ),
    ModelCard(
      image: 'images/timbulun.png',
      panggilanLokasi: 'Air Terjun Timbulun',
      title: 'Air Terjun Timbulun',
      mapLink: 'https://maps.app.goo.gl/R3cAMHSFYf77HSzP6',
      deskripsi:
          'Air terjun yang indah dan sunyi dapat menenangkan diri. Air terjun ini terbagi atas 7 tingkatan dan juga tempat ini merupakan surganya durian.',
      kategori: [Kategori.view],
      jam: '09.00-18.00',
      fasilitas: [
        Fasilitas.toilet,
        Fasilitas.tokoOlehOleh,
      ],
    ),
    ModelCard(
      image: 'images/taluaksikolo.png',
      panggilanLokasi: 'Tarusan',
      title: 'Taluak Sikulo',
      mapLink: 'https://maps.app.goo.gl/Yods8um1aHUBX8PU6',
      deskripsi:
          'Pemandangan yang khas dari batu karang serta dengan deburan ombak. Jika beruntung saat di perjalanan bisa menyaksikan kawanan penyu dan ikan-ikan yang sedang beraktivitas di lautan.',
      kategori: [Kategori.view],
      jam: '08.00-19.00',
      fasilitas: [
        Fasilitas.toilet,
        Fasilitas.tokoOlehOleh,
      ],
    ),
    ModelCard(
      image: 'images/labuansunday.png',
      panggilanLokasi: 'Labuan Sunday',
      title: 'Labuan Sunday',
      mapLink: 'https://maps.app.goo.gl/mxjnBg1hpmfa1ape9',
      deskripsi:
          'Tempat yang tenang dan nyaman cocok untuk refreshing dan juga anak-anak karena di sini banyak ikan kecil dan teripang, yang cocok untuk mendidik anak.',
      kategori: [Kategori.view],
      fasilitas: [
        Fasilitas.penginapan,
        Fasilitas.masjid,
        Fasilitas.makan,
      ],
    ),
    ModelCard(
      panggilanLokasi: 'Negeri Diatas Awan',
      title: 'Negeri Diatas Awan',
      mapLink: 'https://maps.app.goo.gl/pQaohzg7Hfb3uUVV9',
      deskripsi:
          'Tempat asri dan indah dengan pemandangan yang sejuk, obyek wisata yang menakjubkan dan menyenangkan. Tetapi para wisatawan disarankan untuk menggunakan kendaraan roda dua karena jalannya banyak tanjakan dan sempit.',
      kategori: [Kategori.view],
      jam: '08.00-18.00',
      fasilitas: [
        Fasilitas.makan,
        Fasilitas.parkir,
        Fasilitas.toilet,
      ],
    ),
    ModelCard(
      image: 'images/pantaibiru.png',
      panggilanLokasi: 'Pantai Biru',
      title: 'Pantai Biru',
      mapLink: 'https://maps.app.goo.gl/eR9pjNP4T2NNYL2j7',
      deskripsi:
          'Suasana pantai yang sejuk membuat para wisatawan menjadi nyaman dan hemat.',
      kategori: [Kategori.view],
      fasilitas: [
        Fasilitas.makan,
        Fasilitas.toilet,
      ],
    ),
    ModelCard(
        image: 'images/pinukuik.png',
        panggilanLokasi: 'Batang Kapas',
        title: 'Pinukuik Enggi',
        mapLink: 'https://maps.app.goo.gl/eHGrumaXcdtdVF2M9',
        deskripsi:
            'kue pinukuik lembut yang rasa kelapanya gurih dan dimasak secara tredisional',
        kategori: [Kategori.kuliner],
        jam: '05.00-19.00'),
    ModelCard(
        image: 'images/rendanglokana.png',
        panggilanLokasi: 'Bayang',
        title: 'Rendang Lokana',
        mapLink: 'https://maps.app.goo.gl/91cqZ78XxjHKGgGv8',
        deskripsi:
            'Rendang lokan yang gurih dan memiliki rasa rempah yang kuat',
        kategori: [Kategori.kuliner],
        jam: '08.00-21.00'),
    ModelCard(
        image: 'images/satelokan.png',
        panggilanLokasi: 'Surantih',
        title: 'Sate Lokan',
        mapLink: 'https://maps.app.goo.gl/pNspF2initBQEvox7',
        deskripsi:
            'Sate yang enak dengan daging yang besar dan empuk serta kuah yang tak terlalu pedas, cocok dijadikan sarapan',
        kategori: [Kategori.kuliner]),
    ModelCard(
        image: 'images/palaibada.png',
        panggilanLokasi: 'Batang Kapas',
        title: 'Palai Bada Pasisia',
        mapLink: 'https://maps.app.goo.gl/eSKWdz2wyHmxD2XVA',
        deskripsi:
            'rasanya gurih dan memiliki cita rasa tersendiri, ketika kita berbelanja disini menerapkan system take away jadi disarankan memakan nya menggunakan nasi dirumah afar lebih nikmat dan kenyang',
        kategori: [Kategori.kuliner],
        jam: '06.30-22.00'),
    ModelCard(
        image: 'images/unikito.png',
        panggilanLokasi: 'Tarusan',
        title: 'Uni Kito Seafood',
        mapLink: 'https://maps.app.goo.gl/cFzqxoBRdWJ8gLZM6 ',
        deskripsi:
            'Tempat makan ini sangat recomended buat kamu para pecinta seafood segar dan juga memiliki pelayanan yang super ramah.',
        kategori: [Kategori.kuliner],
        jam: '08.00-21.00'),
    ModelCard(
        image: 'images/mandehrubiah.png',
        panggilanLokasi: 'Lunang',
        title: 'Rumah Gadang Mandeh Rubiah',
        mapLink: 'https://maps.app.goo.gl/LRY2dJHehvxLNsnm6',
        deskripsi:
            'Rumah Gadang Mandeh Rubiah merupakan salah satu rumah gadang yang ada di Sumatra Barat tepatnya di kab. Pesisir Selatan, lunang.  Tempat ini adalah museum tempat menyimpan benda benda peninggalan Bundo.',
        kategori: [Kategori.sejarah]),
    ModelCard(
        image: 'images/bentengportugis.png',
        panggilanLokasi: 'Painan',
        title: 'Benteng Portugis',
        mapLink: 'https://maps.app.goo.gl/obG6vGDoMBiGvuZt7',
        deskripsi:
            'Benteng Portugis merupakan benteng peninggalan portugis, posisi benteng ini dimanfaatkan untuk pelayaran dan perdagangan di pesisir Sumatra. Benteng ini terletak di kec. IV Jurai, kab. Pesisr Selatan yang sekarang dijadikan objek wisata. Benteng ini banyak menyimpan Sejarah yang terjadi dimasa lampau.',
        kategori: [Kategori.sejarah]),
    ModelCard(
        image: 'images/kerajaan.png',
        panggilanLokasi: 'Indrapura',
        title: 'Istana Kerajaan Inderapura',
        mapLink: 'https://maps.app.goo.gl/AwoVPrRrKACy9dRy6',
        deskripsi:
            'Kerajann ini terletak di inderapura kab. Pesisir Selatan, tempat ini sangat banyak menyimpan Sejarah tentang bagaimana kejadoan kejadian dimasa lalu.',
        kategori: [Kategori.sejarah]),
    ModelCard(
        image: 'images/tugupiti.png',
        panggilanLokasi: 'Kambang',
        title: 'Tugu Piti',
        deskripsi:
            'Tugu ini terletak di Koto Pulai Nagari Kambang Timur Kec. Lengayang, tugu ini menjadi tanda percetakan uang di Kampung Koto Pulai, Monumen ini memiliki tiga pantung pejuang dengan ukiran mata uang Rp25 dan Rp50 serta ukiran tulisan yang menandakan sejarah itu pernah ada. Tugu monumen ini diperkirakan memiliki tinggi 4-meter dan lebar 1,5-meter diatas tanah seluas 15-meter persegi berlantai keramik dengan hamparan bukit.',
        kategori: [Kategori.sejarah]),
    ModelCard(
        image: 'images/tamanmakam.png',
        panggilanLokasi: 'Painan',
        title: 'Taman Makam Pahlawan',
        mapLink: 'https://maps.app.goo.gl/XFcAxesp34p9j3os5',
        deskripsi:
            'Taman Makam Pahlawan ini terletak di Sago Salido, Kec. IV jurai Kab. Pesisir Selatan.',
        kategori: [Kategori.sejarah]),
    ModelCard(
        image: 'images/masjid.png',
        panggilanLokasi: 'Kambang',
        title: 'Masjid Al-Imam Koto Baru',
        mapLink: 'https://maps.app.goo.gl/QdrYrXSacLxbCo3W9',
        deskripsi:
            'Masjid ini menyimpan banyak Sejarah karena merupakan masjid tertua di Kabupaten Pesisir Selatan, Masjid ini didirikan pada tahun 1924 yang digagaskan oleh pemimpin nagari Kambang pada ssat itu yakni Oemar Sutan Bagindo Rajo Bukit',
        kategori: [Kategori.sejarah]),
    ModelCard(
        image: 'images/sanggar.png',
        panggilanLokasi: 'Punggasan',
        title: 'Sanggar Bukik Paninjawuan',
        deskripsi:
            'Sanggar ini merupakan salah satu pusat kesenian yang ada di Pesisir Selatan, seperti tari randai dan kesenian lainnya.',
        kategori: [Kategori.seniBudaya]),
    ModelCard(
        image: 'images/sanggarseni.png',
        panggilanLokasi: 'Ranah Pesisir',
        title: 'Sanggar Seni Rupa Anak Nagari',
        deskripsi:
            'Sanggar ini terletak di kec. Ranah Pesisir, sanggar ini lebih focus kepada seni luki dan kerajinan tangan lainnya.',
        kategori: [Kategori.seniBudaya]),
    ModelCard(
        image: 'images/tradisibailau.png',
        panggilanLokasi: 'Pesisir Selatan',
        title: 'Tradisi Bailau',
        deskripsi:
            'Bailau juga dapat disebut sebagai sastra lisan yang berasal dari Minangkabau, tradisi ini biasanya dilakukan oleh perempuan yang disebut tukang ilau. Bailau ini berupa menyampaikan, bercerita tentang legenda legenda, mitos mitos yang ada dan diiringi dengan iringan musik, namun tradisi ini tidak cukup terkenal hanya ada di beberapa tempat saja.',
        kategori: [Kategori.seniBudaya]),
    ModelCard(
        image: 'images/tradisiparang.png',
        panggilanLokasi: 'Pesisir Selatan',
        title: 'Tradisi Parang Pisang',
        deskripsi:
            'Tradisi parang pisang di Pesisir Selatan berbeda dengan parang pisang yang ada di daerah lain, di Minang “parang” berarti pedang atau senjata tajam, dan “pisang” berarti pisang atau buah pisang. Tradisi ini dilakukan dengan tujuan memisahkan bayi kembar yang baru lahir karena di daerah ini bayi kembar dapat membawa malapetaka, untuk itu tradisi ini dilakukan yang dipercaya dapat mengusir roh jahat yang mengganggu dan membawa dampak negatif.',
        kategori: [Kategori.seniBudaya]),
    ModelCard(
        image: 'images/kapal.png',
        panggilanLokasi: 'Pesisir Selatan',
        title: 'Pembuatan Kapal Bagan',
        deskripsi:
            'Kapal bagan adalah kapal tradisional yang dimiliki oleh masyarakat Pesisir Selatan untuk menankap ikan. Pembuatan kapal bagan ini menyangkut dengan cara cara, bahan bahan yang digunakan.',
        kategori: [Kategori.seniBudaya]),
    ModelCard(
        image: 'images/babako.png',
        panggilanLokasi: 'Pesisir Selatan',
        title: 'Babako',
        deskripsi:
            'Babako adalah upacara adat pra kawin yang dilakukan oleh keluarga pihak ayah, atau mengarak marapulai atau anak daro dari rumah bako kerumah acara pesta.',
        kategori: [Kategori.seniBudaya]),
    ModelCard(
        image: 'images/manujuahari.png',
        panggilanLokasi: 'Pesisir Selatan',
        title: 'Manujuah Hari',
        deskripsi:
            'Manujuah hari merupakan tradisi yang dilakukan etika ada seseorang meninggal dunia kemudian setelah 7 hari penguburannya akan diadakan acara berdoa bersama yang disebut dengan manujuah hari.',
        kategori: [Kategori.seniBudaya]),
  ];
  UnmodifiableListView<ModelCard> get cards => UnmodifiableListView(_cards);

  int get cardCount => _cards.length;

  Future<void> updateFavoriteStatus(ModelCard card) async {
    card.toggleFavorite();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(card.title, card.isFavorite);
    loadFavoriteStatus();
    print(prefs.getBool(card.title));
    notifyListeners();
  }

  void loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var card in _cards) {
      if (prefs.getBool(card.title) == true) {
        card.isFavorite = true;
        print(card);
      }
    }
    notifyListeners();
  }

  int selectedKategoriIndex = 0;
  int selectedFilter = 0;
  int selectedNavBar = 0;

  void onItemTapped(int index) {
    selectedKategoriIndex = index;
    notifyListeners();
  }

  void onFilterTapped(int index) {
    selectedFilter = index;
    notifyListeners();
  }

  void onNavBarTapped(int index) {
    selectedNavBar = index;
    notifyListeners();
  }
}
