// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_kipas/constant.dart';
import 'package:si_kipas/models/card_model.dart';
import 'package:si_kipas/models/data_model.dart';
import 'package:si_kipas/models/fasilitas_model.dart';
import 'package:si_kipas/models/kategori_model.dart';
import 'package:si_kipas/widgets/facility_card.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailCard extends StatelessWidget {
  final DataModel data;
  final ModelCard card;

  const DetailCard({
    Key? key,
    required this.data,
    required this.card,
  }) : super(key: key);

  Future<void> _launchURL(String url) async {
    final Uri urlUri = Uri.parse(url);
    if (!await launchUrl(urlUri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 360,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                card.image ?? 'images/login-bg.png',
                                width: double.infinity,
                                height: 340,
                                fit: BoxFit.cover,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: kGrey,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Icon(
                                    FluentIcons.chevron_left_20_filled,
                                    color: kGreyText,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  Provider.of<DataModel>(context, listen: false)
                                      .updateFavoriteStatus(card);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    width: 44,
                                    height: 44,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: kGrey,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 20,
                                              offset: const Offset(0, 6),
                                              color: const Color(0xFF0038FF)
                                                  .withOpacity(0.2))
                                        ]),
                                    child: (Provider.of<DataModel>(context)
                                            .cards[data.cards.indexOf(card)]
                                            .isFavorite)
                                        ? const Icon(
                                            FluentIcons.heart_24_filled,
                                            color: kRed,
                                            size: 27,
                                          )
                                        : const Icon(
                                            FluentIcons.heart_24_regular,
                                            color: kGreyText,
                                            size: 27,
                                          ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        card.title,
                        style: kSemiBoldTextStyle.copyWith(fontSize: 24),
                      ),
                      if (card.kategori.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: List.generate(
                                card.kategori.length,
                                (index) => Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: filter[
                                                    card.kategori[index].index +
                                                        1]
                                                .color,
                                          ),
                                          child: Text(
                                              filter[card.kategori[index]
                                                          .index +
                                                      1]
                                                  .title!,
                                              style: kMediumTextStyle),
                                        ),
                                        if (!(card.kategori.length - 1 ==
                                            index))
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            height: 4,
                                            width: 4,
                                            decoration: const BoxDecoration(
                                                color: kGreyText,
                                                shape: BoxShape.circle),
                                          ),
                                      ],
                                    )),
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        card.deskripsi,
                        style: kRegularTextStyle.copyWith(fontSize: 14),
                      ),
                    ]),
              ),
              if (card.fasilitas != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Fasilitas',
                        style: kSemiBoldTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(height: 112),
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          physics: const BouncingScrollPhysics(),
                          itemCount: card.fasilitas!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: EdgeInsets.only(
                                    left: (index == 0) ? 0 : 12),
                                child: FacilityCard(
                                    icon:
                                        facilities[card.fasilitas![index].index]
                                            .icon,
                                    color:
                                        facilities[card.fasilitas![index].index]
                                            .color,
                                    title:
                                        facilities[card.fasilitas![index].index]
                                            .title));
                          }),
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lokasi',
                      style: kSemiBoldTextStyle.copyWith(fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchURL(card.mapLink!);
                      },
                      child: Text(
                        'Show Map',
                        style: kSemiBoldTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
