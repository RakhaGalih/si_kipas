import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_kipas/models/card_model.dart';

class DataModel extends ChangeNotifier {
  final List<ModelCard> _cards = [
    ModelCard(
      image: 'images/pantai.png',
      panggilanLokasi: 'Painan',
      title: 'Pantai Carocok Painan',
      deskripsi:
          'Salah satu kawasan pantai yang terkenal di daerah pesisir selatan. Pantai carocok ini juga terkenal karena masjidnya yang biasa dikenal dengan masjid terapung dan juga banyak disuguhi dengan permainan anak-anak.',
      kategori: [Kategori.view, Kategori.sejarah],
      jam: '07.00-21.00',
      fasilitas: [
        Fasilitas.masjid,
        Fasilitas.tokoOlehOleh,
        Fasilitas.toilet,
      ],
    ),
    ModelCard(
      panggilanLokasi: 'Jembatan Akar Bayang',
      title: 'Jembatan Akar Bayang',
      deskripsi:
          'Jembatan akar ini cocok dijadikan tempat rekreaksi keluarga. Dua buah akar pohon beringin yang menjadi satu membuat jembatan ini sangat unik dan memanjakan mata bagi yang melihatnya.',
      kategori: [Kategori.populer, Kategori.kuliner],
      jam: '08.00-18.00',
      fasilitas: [
        Fasilitas.toilet,
        Fasilitas.tokoOlehOleh,
      ],
    ),
    ModelCard(
      panggilanLokasi: 'Kawasan Mandeh',
      title: 'Kawasan Mandeh',
      deskripsi:
          'Gugusan pulau kecil dengan air laut yang jernih, alam yang terjaga memanjakan mata kita selama berada di sini. Banyak yang bilang tempat ini merupakan Raja Ampat-nya Sumbar.',
      kategori: [Kategori.view],
      fasilitas: [
        Fasilitas.toilet,
      ],
    ),
    ModelCard(
      panggilanLokasi: 'Taman Wisata Sumedang',
      title: 'Taman Wisata Sumedang',
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
      panggilanLokasi: 'Bukit Langkisau',
      title: 'Bukit Langkisau',
      deskripsi:
          'Tempat peluncuran paralayang yang memiliki pemandangan indah ke kota Painan dan lautan. Tempat ini sangat cocok untuk para penikmat sunset.',
      kategori: [Kategori.view],
      fasilitas: [
        Fasilitas.toilet,
      ],
    ),
    ModelCard(
      panggilanLokasi: 'Air Terjun Timbulun',
      title: 'Air Terjun Timbulun',
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
      panggilanLokasi: 'Taluak Sikulo',
      title: 'Taluak Sikulo',
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
      panggilanLokasi: 'Labuan Sunday',
      title: 'Labuan Sunday',
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
      panggilanLokasi: 'Pantai Biru',
      title: 'Pantai Biru',
      deskripsi:
          'Suasana pantai yang sejuk membuat para wisatawan menjadi nyaman dan hemat.',
      kategori: [Kategori.view],
      fasilitas: [
        Fasilitas.makan,
        Fasilitas.toilet,
      ],
    ),
  ];

  UnmodifiableListView<ModelCard> get cards => UnmodifiableListView(_cards);

  int get cardCount => _cards.length;

  Future<void> updateFavoriteStatus(ModelCard card) async {
    card.toggleFavorite();
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(card.title, card.isFavorite);
    print(prefs.getBool(card.title));
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
