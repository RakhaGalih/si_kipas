import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:si_kipas/constant.dart';
import 'package:si_kipas/models/navcard_model.dart';

List<NavIcon> filter = [
  const NavIcon(title: 'Semua', icon: FluentIcons.apps_16_filled, color: kRed),
  const NavIcon(
      title: 'Populer', icon: FluentIcons.star_16_filled, color: kOrange),
  const NavIcon(
      title: 'Pemandangan', icon: FluentIcons.beach_16_filled, color: kGreen),
  const NavIcon(
      title: 'Kuliner',
      icon: FluentIcons.bowl_chopsticks_16_filled,
      color: kBlue),
  const NavIcon(
      title: 'Seni & Budaya',
      icon: FluentIcons.color_16_filled,
      color: kPurple),
  const NavIcon(
    title: 'Sejarah',
    icon: FluentIcons.compass_northwest_16_filled,
    color: kMagenta,
  )
];
