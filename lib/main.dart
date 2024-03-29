import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_kipas/models/data_model.dart';
import 'package:si_kipas/screens/auth/starter.dart';

void main() {
  DataModel data = DataModel();
  data.loadFavoriteStatus();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataModel>(
      create: (_) => DataModel(),
      child: MaterialApp(
          theme: ThemeData(
              fontFamily: "Poppins",
              primarySwatch: Colors.teal,
              primaryColor: Colors.teal),
          home: const Starter()),
    );
  }
}
