// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:si_kipas/constant.dart';

class HomeTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const HomeTitle({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kSemiBoldTextStyle.copyWith(fontSize: 34),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          subtitle,
          style: kRegularTextStyle.copyWith(fontSize: 12, color: kGreyBlue),
        ),
      ],
    );
  }
}
