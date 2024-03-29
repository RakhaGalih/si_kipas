import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_kipas/models/card_model.dart';
import 'package:si_kipas/models/data_model.dart';
import 'package:si_kipas/models/kategori_model.dart';
import 'package:si_kipas/widgets/card.dart';
import 'package:si_kipas/widgets/category_card.dart';
import 'package:si_kipas/widgets/home_title.dart';

class KategoriScreen extends StatelessWidget {
  const KategoriScreen({super.key});

  List<ModelCard> getList(bool isAll, List<ModelCard> cards, DataModel data) {
    List<ModelCard> filteredCards = [];
    if (isAll) {
      return cards;
    } else {
      for (var card in cards) {
        for (var item in card.kategori) {
          print(item);
          if (item.index == data.selectedFilter - 1) {
            filteredCards.add(card);
            print(card);
          }
        }
      }
      return filteredCards;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(builder: (context, data, child) {
      bool isAll = data.selectedFilter == 0;
      List<ModelCard> filteredCards = getList(isAll, data.cards, data);
      return Scaffold(
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: HomeTitle(
                  title: 'Kategori', subtitle: 'Pilih Berdasarkan Kategori'),
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const BouncingScrollPhysics(),
                  itemCount: filter.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          right: (index == filter.length - 1) ? 0 : 12),
                      child: CatCard(
                        index: index,
                        isActive: data.selectedFilter == index,
                        icon: filter[index].icon,
                        color: filter[index].color,
                        title: filter[index].title!,
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                primary: false,
                childAspectRatio: 5 / 6,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 2,
                children: List.generate(
                    (isAll) ? data.cardCount : filteredCards.length,
                    (index) => MyCard(
                          index: index,
                          data: data,
                          list: (isAll) ? data.cards : filteredCards,
                        )),
              ),
            )
          ]),
        ),
      );
    });
  }
}
