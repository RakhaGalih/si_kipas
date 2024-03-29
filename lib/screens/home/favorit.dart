// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:si_kipas/models/card_model.dart';
import 'package:si_kipas/models/data_model.dart';
import 'package:si_kipas/widgets/card.dart';
import 'package:si_kipas/widgets/home_title.dart';

class Favorite extends StatelessWidget {
  final DataModel data;
  const Favorite({
    Key? key,
    required this.data,
  }) : super(key: key);

  List<ModelCard> getList(List<ModelCard> cards, DataModel data) {
    List<ModelCard> filteredCards = [];
    for (var card in cards) {
      if (card.isFavorite) {
        filteredCards.add(card);
      }
    }

    return filteredCards;
  }

  @override
  Widget build(BuildContext context) {
    List<ModelCard> filteredCards = getList(data.cards, data);
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeTitle(
                title: 'Favorit', subtitle: 'Galeri Favoritmu Ada di Sini!'),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  primary: false,
                  childAspectRatio: 5 / 6,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                  children: List.generate(
                    filteredCards.length,
                    (index) => MyCard(
                      index: index,
                      data: data,
                      list: filteredCards,
                    ),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
