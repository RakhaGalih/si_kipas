import 'package:flutter/material.dart';
import 'package:si_kipas/constant.dart';
import 'package:si_kipas/widgets/button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LoginState();
}

class _LoginState extends State<SignUp> {
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
                        TextField(
                          obscureText: _isObscure,
                          decoration: kTextFieldInputDecoration.copyWith(
                              hintText: 'Konfirmasi Password',
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
                        SecondaryButton(
                            title: 'Sign Up',
                            onTap: () {
                              Navigator.of(context).pop();
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
