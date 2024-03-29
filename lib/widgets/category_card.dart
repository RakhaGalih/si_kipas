// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:si_kipas/constant.dart';
import 'package:si_kipas/models/data_model.dart';

class CatCard extends StatelessWidget {
  final int index;
  final bool isActive;
  final IconData icon;
  final Color color;
  final String title;

  const CatCard({
    Key? key,
    required this.index,
    required this.isActive,
    required this.icon,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: (isActive) ? color : kGrey,
      child: InkWell(
        splashColor: color,
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Provider.of<DataModel>(context, listen: false).onFilterTapped(index);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: (isActive) ? kWhite : color,
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: (isActive) ? color : kWhite,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: (isActive)
                    ? kMediumTextStyle.copyWith(fontSize: 15, color: kWhite)
                    : kRegularTextStyle.copyWith(
                        fontSize: 15,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
