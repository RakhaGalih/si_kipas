import 'package:flutter/material.dart';
import 'package:si_kipas/constant.dart';
import 'package:si_kipas/screens/auth/signup.dart';
import 'package:si_kipas/screens/home/home.dart';
import 'package:si_kipas/widgets/button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/logo kipas.png'),
                  const Spacer(),
                  TextField(
                    decoration:
                        kTextFieldInputDecoration.copyWith(hintText: 'Email'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: _isObscure,
                    decoration: kTextFieldInputDecoration.copyWith(
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            child: Icon(
                              (_isObscure)
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kGreyText,
                            ))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MainButton(
                    title: 'Masuk',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MainButton(
                      title: 'Daftar',
                      isSecondary: true,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
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
