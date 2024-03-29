import 'package:flutter/material.dart';
import 'package:si_kipas/constant.dart';
import 'package:si_kipas/screens/auth/login.dart';
import 'package:si_kipas/widgets/button.dart';

class Starter extends StatelessWidget {
  const Starter({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
            child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/login-bg.png'), fit: BoxFit.cover)),
          child: SafeArea(
            child: Container(
              width: double.maxFinite,
              height: height,
              padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset('images/logo kipas.png')),
                  const Spacer(),
                  Text(
                    'Jelajahi',
                    style:
                        kMediumTextStyle.copyWith(fontSize: 24, color: kWhite),
                  ),
                  Text(
                    'Berbagai\nTempat\nMenarik',
                    style:
                        kMediumTextStyle.copyWith(fontSize: 40, color: kWhite),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MainButton(
                      title: 'Mulai',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      })
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
