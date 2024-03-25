import 'package:flutter/material.dart';
import 'package:si_kipas/constant.dart';

class NavBarIcon extends StatelessWidget {
  const NavBarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kRed,
      ),
    );
  }
}
