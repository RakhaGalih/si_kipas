import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_kipas/constant.dart';
import 'package:si_kipas/models/card_model.dart';
import 'package:si_kipas/models/data_model.dart';
import 'package:si_kipas/widgets/card.dart';

class KategoriScreen extends StatelessWidget {
  const KategoriScreen({super.key});

  List<ModelCard> getList(bool isAll, List<ModelCard> cards, DataModel data) {
    List<ModelCard> filteredCards = [];
    if (isAll) {
      return cards;
    } else {
      for (var card in cards) {
        card.kategori?.forEach((item) {
          print(item);
          if (item.index == data.selectedFilter - 1) {
            filteredCards.add(card);
            print(card);
          }
        });
      }
      return filteredCards;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> filter = [
      'Semua',
      'Populer',
      'View',
      'Kuliner',
      'Seni & Budaya',
      'Sejarah',
    ];
    return Consumer<DataModel>(builder: (context, data, child) {
      bool isAll = data.selectedFilter == 0;
      List<ModelCard> filteredCards = getList(isAll, data.cards, data);
      return Scaffold(
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 35,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: filter.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: 15,
                            right: (index == filter.length - 1) ? 15 : 0),
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<DataModel>(context, listen: false)
                                .onFilterTapped(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: (index == data.selectedFilter)
                                    ? kRed
                                    : kWhite,
                                border: Border.all(
                                  color: kRed.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              filter[index],
                              style: TextStyle(
                                  color: (index == data.selectedFilter)
                                      ? Colors.white
                                      : kRed),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                childAspectRatio: 5 / 6,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
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
