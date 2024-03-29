import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_kipas/models/data_model.dart';
import 'package:si_kipas/models/home_card_model.dart';
import 'package:si_kipas/widgets/home_card.dart';
import 'package:si_kipas/widgets/home_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<HomeCardModel> populer = [
      HomeCardModel('Pemandangan', 'Temukan keindahan alam yang tersembunyi!'),
      HomeCardModel(
          'Kuliner', 'Temukan hidangan lezat yang wajib kalian cicipi!')
    ];
    List<HomeCardModel> rekomendasi = [
      HomeCardModel('Pulau Pasumpahan', 'Bungus, Pesisir Selatan'),
      HomeCardModel('Pantai Cacorok', 'Painan, Pesisir Selatan'),
      HomeCardModel('Museum Mandeh Rubiah', 'Lunang, Pesisir Selatan'),
    ];
    Provider.of<DataModel>(context).loadFavoriteStatus();
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: HomeTitle(
                title: 'Temukan',
                subtitle: 'Destinasi Menarik di Sekitar Anda'),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const BouncingScrollPhysics(),
                itemCount: populer.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(left: (index == 0) ? 0 : 12),
                      child: HomeCard(
                          title: populer[index].title,
                          desc: populer[index].desc));
                }),
          ),
        ],
      )),
    );
  }
}
