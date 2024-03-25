import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_kipas/constant.dart';
import 'package:si_kipas/models/data_model.dart';
import 'package:si_kipas/screens/home/favorit.dart';
import 'package:si_kipas/screens/home/homepage.dart';
import 'package:si_kipas/screens/home/kategori.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> widgetOptions = <Widget>[
      HomePage(),
      KategoriScreen(),
      Favorite()
    ];
    return Scaffold(
      body: widgetOptions
          .elementAt(Provider.of<DataModel>(context).selectedKategoriIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.backpack),
            label: 'Kategori',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorit',
          ),
        ],
        backgroundColor: kWhite,
        currentIndex: Provider.of<DataModel>(context).selectedKategoriIndex,
        selectedItemColor: kRed,
        selectedIconTheme: const IconThemeData(fill: 1),
        onTap: (index) {
          Provider.of<DataModel>(context, listen: false).onItemTapped(index);
        },
      ),
    );
  }
}
