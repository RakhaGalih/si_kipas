// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:si_kipas/models/card_model.dart';

class DetailCard extends StatelessWidget {
  final int index;
  final ModelCard card;
  const DetailCard({
    Key? key,
    required this.index,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text(
        "WADEHEHEEEELL OOMAGAAAAA",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
        ),
      ),
    );
  }
}
