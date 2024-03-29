// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:si_kipas/constant.dart';

class FacilityCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  const FacilityCard({
    Key? key,
    required this.icon,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 88,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kGrey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: kWhite,
              ),
              child: Icon(
                icon,
                size: 30,
                color: color,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: kRegularTextStyle.copyWith(
                  fontSize: 12, color: const Color(0xFF222222)),
            )
          ],
        ));
  }
}
