import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_kipas/constant.dart';
import 'package:si_kipas/models/card_model.dart';
import 'package:si_kipas/models/data_model.dart';
import 'package:si_kipas/widgets/card.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    List<ModelCard> filteredCards = [];
    void getList() async {
      Provider.of<DataModel>(context, listen: false).loadFavoriteStatus();
      for (var card in Provider.of<DataModel>(context, listen: false).cards) {
        if (card.isFavorite) {
          filteredCards.add(card);
        }
      }
    }

    getList();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  getList();
                },
                child: const Text(
                  'Favorit',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: kRed,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                    primary: false,
                    childAspectRatio: 5 / 6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: List.generate(
                      filteredCards.length,
                      (index) => MyCard(
                        index: index,
                        data: Provider.of<DataModel>(context),
                        list: filteredCards,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
