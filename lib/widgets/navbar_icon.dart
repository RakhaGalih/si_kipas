// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_kipas/constant.dart';
import 'package:si_kipas/models/data_model.dart';

class NavBarIcon extends StatelessWidget {
  final int index;
  final bool isActive;
  final Color color;
  final IconData icon;
  final IconData activeIcon;
  const NavBarIcon({
    Key? key,
    required this.index,
    required this.isActive,
    required this.color,
    required this.icon,
    required this.activeIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<DataModel>(context, listen: false).onNavBarTapped(index);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (isActive) ? color : kWhite.withOpacity(0),
        ),
        child: Icon(
          (isActive) ? activeIcon : icon,
          size: 24,
          color: (isActive) ? kWhite : kGreyText,
        ),
      ),
    );
  }
}
