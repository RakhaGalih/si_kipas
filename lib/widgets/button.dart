// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:si_kipas/constant.dart';

class MainButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function() onTap;
  final Color color;
  const MainButton({
    Key? key,
    required this.title,
    this.icon,
    required this.onTap,
    this.color = kRed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: double.maxFinite,
          height: 58,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
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
                style: kSemiBoldTextStyle.copyWith(color: kWhite, fontSize: 20),
              ),
            ],
          ),
        ));
  }
}

class SecondaryButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function() onTap;
  const SecondaryButton({
    Key? key,
    required this.title,
    this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: double.maxFinite,
          height: 58,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: kRed),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    icon,
                    color: kRed,
                  ),
                ),
              Text(
                title,
                style: kSemiBoldTextStyle.copyWith(color: kRed, fontSize: 20),
              ),
            ],
          ),
        ));
  }
}
