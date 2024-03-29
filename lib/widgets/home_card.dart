// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:si_kipas/constant.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String desc;
  const HomeCard({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBlue,
      width: 100,
      height: 200,
      child: GestureDetector(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Column(
            children: [
              Text(
                title,
                style: kSemiBoldTextStyle.copyWith(fontSize: 15),
              ),
              Text(
                desc,
                style: kRegularTextStyle.copyWith(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
