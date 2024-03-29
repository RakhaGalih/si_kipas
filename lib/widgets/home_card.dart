// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:si_kipas/constant.dart';

class HomeCard extends StatelessWidget {
  final bool isRekomendasi;
  final String title;
  final String desc;
  final String image;
  final void Function() onTap;
  const HomeCard({
    Key? key,
    required this.isRekomendasi,
    required this.title,
    required this.desc,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
            color: kWhite,
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(28)),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                    begin: Alignment(0, (isRekomendasi) ? -1 : 0),
                    end: const Alignment(0, 1),
                    colors: <Color>[
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.7),
                    ]),
              ),
            ),
            Align(
              alignment:
                  (isRekomendasi) ? Alignment.center : Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: (isRekomendasi)
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  mainAxisAlignment: (isRekomendasi)
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: kSemiBoldTextStyle.copyWith(
                          fontSize: (isRekomendasi) ? 20 : 15, color: kWhite),
                    ),
                    SizedBox(
                      height: (isRekomendasi) ? 4 : 12,
                    ),
                    Text(
                      desc,
                      style: kRegularTextStyle.copyWith(
                          fontSize: (isRekomendasi) ? 12 : 10, color: kWhite),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
