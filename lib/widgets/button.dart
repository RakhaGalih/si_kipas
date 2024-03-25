// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:si_kipas/constant.dart';

class MainButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function() onTap;
  final bool isSecondary;
  const MainButton({
    Key? key,
    required this.title,
    this.icon,
    required this.onTap,
    this.isSecondary = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
              color: (isSecondary) ? kWhite : kRed,
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    icon,
                    color: kWhite,
                  ),
                ),
              Text(
                title,
                style: kSemiBoldTextStyle.copyWith(
                    color: (isSecondary) ? kRed : kWhite, fontSize: 16),
              ),
            ],
          ),
        ));
  }
}
