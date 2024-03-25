// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:si_kipas/constant.dart';
import 'package:si_kipas/models/card_model.dart';
import 'package:si_kipas/models/data_model.dart';
import 'package:si_kipas/screens/home/detail.dart';

class MyCard extends StatelessWidget {
  final int index;
  final List<ModelCard> list;
  final DataModel data;
  const MyCard({
    Key? key,
    required this.index,
    required this.list,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ModelCard card = list[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (i) => DetailCard(
                index: index,
                card: card,
              ),
            ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: kGrey),
                    image: const DecorationImage(
                        image: AssetImage('images/login.png'))),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                            begin: const Alignment(0, 0),
                            end: const Alignment(0, 1),
                            colors: <Color>[
                              Colors.black.withOpacity(0.0),
                              Colors.black.withOpacity(0.5),
                            ]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          data.updateFavoriteStatus(card);
                        },
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12)),
                                color: kRed),
                            child: (card.isFavorite)
                                ? const Icon(
                                    Icons.favorite,
                                    color: kGrey,
                                    size: 27,
                                  )
                                : const Icon(
                                    Icons.favorite_outline,
                                    color: kGrey,
                                    size: 27,
                                  )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            card.title,
                            style: kSemiBoldTextStyle.copyWith(
                                color: kWhite, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: kGrey,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  card.deskripsi,
                                  overflow: TextOverflow.ellipsis,
                                  style: kRegularTextStyle.copyWith(
                                      color: kWhite, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
