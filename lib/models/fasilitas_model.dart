import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:si_kipas/constant.dart';

enum Fasilitas {
  makan,
  tempatSantai,
  snorkeling,
  toilet,
  masjid,
  penginapan,
  tokoOlehOleh,
  parkir,
  kapal,
  tenda
}

List<FasilitasModel> facilities = [
  FasilitasModel(
      title: 'Makan / Jajanan',
      icon: FluentIcons.bowl_chopsticks_20_filled,
      color: kRed),
  FasilitasModel(
      title: 'Tempat Santai',
      icon: FluentIcons.bowl_chopsticks_20_filled,
      color: kOrange),
  FasilitasModel(title: 'Snorkeling', icon: Icons.scuba_diving, color: kBlue),
  FasilitasModel(
      title: 'Toilet',
      icon: FluentIcons.calendar_today_20_filled,
      color: kMagenta),
  FasilitasModel(title: 'Masjid', icon: Icons.mosque, color: kLightGreen),
  FasilitasModel(
      title: 'Penginapan',
      icon: FluentIcons.building_retail_toolbox_20_filled,
      color: kGreen),
  FasilitasModel(
      title: 'Toko Oleh-Oleh',
      icon: FluentIcons.building_shop_20_filled,
      color: kPurple),
  FasilitasModel(
      title: 'Parkir',
      icon: FluentIcons.vehicle_car_20_filled,
      color: kGreyBlue),
  FasilitasModel(
      title: 'Kapal',
      icon: FluentIcons.vehicle_ship_20_filled,
      color: kLightBlue),
  FasilitasModel(
    title: 'Tenda',
    icon: FluentIcons.tent_20_filled,
    color: kYellow,
  )
];

class FasilitasModel {
  String title;
  IconData icon;
  Color color;
  FasilitasModel({
    required this.title,
    required this.icon,
    required this.color,
  });
}
