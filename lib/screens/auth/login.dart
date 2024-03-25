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
          child: SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Image.asset('images/login.png'),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    height: height,
                    color: kWhite,
                    padding: const EdgeInsets.symmetric(
                        vertical: 45, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: kTextFieldInputDecoration.copyWith(
                              hintText: 'Email'),
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
                          title: 'Sign In',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/signIn');
                          },
                          child: Text(
                            'Lupa password',
                            style: kMediumTextStyle.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: kRed,
                                fontSize: 14,
                                color: kRed),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Belum punya akun?',
                          style: kMediumTextStyle.copyWith(
                              fontSize: 14, color: kGreyText),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SecondaryButton(
                            title: 'Sign Up',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
