import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_kipas/constant.dart';
import 'package:si_kipas/models/data_model.dart';
import 'package:si_kipas/models/home_card_model.dart';
import 'package:si_kipas/widgets/home_card.dart';
import 'package:si_kipas/widgets/home_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<HomeCardModel> populer = [
      HomeCardModel('Pemandangan', 'Temukan keindahan alam yang tersembunyi!',
          'images/labuansunday.png'),
      HomeCardModel(
          'Kuliner',
          'Temukan hidangan lezat yang wajib kalian cicipi!',
          'images/rendanglokana.png')
    ];
    List<HomeCardModel> rekomendasi = [
      HomeCardModel('Kawasan Mandeh', 'Bungus, Pesisir Selatan',
          'images/kawasanmandeh.png'),
      HomeCardModel('Pantai Cacorok', 'Painan, Pesisir Selatan',
          'images/pantaicacorok.png'),
      HomeCardModel('Museum Mandeh Rubiah', 'Lunang, Pesisir Selatan',
          'images/mandehrubiah.png'),
    ];
    Provider.of<DataModel>(context).loadFavoriteStatus();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: HomeTitle(
                  title: 'Temukan',
                  subtitle: 'Destinasi Menarik di Sekitar Anda'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text(
                'Populer',
                style: kSemiBoldTextStyle.copyWith(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 280,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const BouncingScrollPhysics(),
                  itemCount: populer.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(left: (index == 0) ? 0 : 12),
                        child: SizedBox(
                          width: 212,
                          child: HomeCard(
                              isRekomendasi: false,
                              image: populer[index].image,
                              title: populer[index].title,
                              desc: populer[index].desc),
                        ));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Rekomendasi',
                style: kSemiBoldTextStyle.copyWith(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: List.generate(
                    rekomendasi.length,
                    (index) => Padding(
                        padding: EdgeInsets.only(top: (index == 0) ? 0 : 12),
                        child: SizedBox(
                          height: 160,
                          child: HomeCard(
                              isRekomendasi: true,
                              image: rekomendasi[index].image,
                              title: rekomendasi[index].title,
                              desc: rekomendasi[index].desc),
                        ))),
              ),
            )
          ],
        )),
      ),
    );
  }
}
