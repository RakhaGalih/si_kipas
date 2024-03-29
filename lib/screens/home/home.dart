import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_kipas/constant.dart';
import 'package:si_kipas/models/data_model.dart';
import 'package:si_kipas/models/navcard_model.dart';
import 'package:si_kipas/screens/home/favorit.dart';
import 'package:si_kipas/screens/home/homepage.dart';
import 'package:si_kipas/screens/home/kategori.dart';
import 'package:si_kipas/widgets/navbar_icon.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> widgetOptions = <Widget>[
      HomePage(),
      KategoriScreen(),
      Favorite()
    ];
    List<NavIcon> navIcons = [
      const NavIcon(
          icon: FluentIcons.apps_20_regular,
          activeIcon: FluentIcons.apps_20_filled,
          color: kRed),
      const NavIcon(
          icon: FluentIcons.apps_list_20_regular,
          activeIcon: FluentIcons.apps_list_20_filled,
          color: kRed),
      const NavIcon(
          icon: FluentIcons.heart_20_regular,
          activeIcon: FluentIcons.heart_20_filled,
          color: kRed),
    ];
    return Scaffold(
      body: widgetOptions
          .elementAt(Provider.of<DataModel>(context).selectedKategoriIndex),
      bottomNavigationBar: Material(
        color: kGrey,
        child: InkWell(
          onTap: () {},
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                      navIcons.length,
                      (index) => NavBarIcon(
                            isActive: Provider.of<DataModel>(context)
                                    .selectedNavBar ==
                                index,
                            index: index,
                            color: navIcons[index].color,
                            icon: navIcons[index].icon,
                            activeIcon: navIcons[index].activeIcon!,
                          ))),
            ),
          ),
        ),
      ),
    );
  }
}
