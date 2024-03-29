import 'package:si_kipas/models/fasilitas_model.dart';

class ModelCard {
  final String? image;
  final String title;
  final String deskripsi;
  final List<Kategori> kategori;
  final String? jam;
  final String panggilanLokasi;
  final String? lokasi;
  final String? mapLink;
  bool isFavorite;
  final List<Fasilitas>? fasilitas;
  ModelCard(
      {required this.panggilanLokasi,
      this.image,
      required this.title,
      required this.deskripsi,
      required this.kategori,
      this.jam,
      this.lokasi,
      this.mapLink,
      this.fasilitas,
      this.isFavorite = false});

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}

enum Kategori { populer, view, kuliner, seniBudaya, sejarah }
