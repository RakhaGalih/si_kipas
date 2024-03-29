// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
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
                data: data,
                card: card,
              ),
            ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kGrey),
                  image: DecorationImage(
                      image: AssetImage(card.image ?? 'images/login-bg.png'),
                      fit: BoxFit.cover),
                ),
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
                              color: kRed,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16)),
                            ),
                            child: (card.isFavorite)
                                ? const Icon(
                                    FluentIcons.heart_24_filled,
                                    color: kGrey,
                                    size: 27,
                                  )
                                : const Icon(
                                    FluentIcons.heart_24_regular,
                                    color: kGrey,
                                    size: 27,
                                  )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
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
                            height: 7,
                          ),
                          Row(
                            children: [
                              const Icon(
                                FluentIcons.location_12_filled,
                                color: kRed,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  card.panggilanLokasi,
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
