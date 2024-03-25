import 'package:flutter/material.dart';

const kGradientBlue =
    LinearGradient(begin: Alignment(-1, -1), end: Alignment(2, 1), colors: [
  Color(0xFF2A8EE6),
  Color(0xFFFAFAFA),
]);
const kGradientRed =
    LinearGradient(begin: Alignment(-1, -1), end: Alignment(2, 1), colors: [
  Color(0xFFCD1A1A),
  Color(0xFFFAFAFA),
]);
const kWhite = Color(0xFFFAFAFA);
const kRed = Color(0xFFEB5757);
const kGreyText = Color(0xFFABABAB);
const kGrey = Color(0xFFF0F0F0);
const kIndigo = Color(0xFF0E185F);
const kLightTextStyle = TextStyle(fontWeight: FontWeight.w300);
const kRegularTextStyle = TextStyle(fontWeight: FontWeight.w400);
const kMediumTextStyle = TextStyle(fontWeight: FontWeight.w500);
const kSemiBoldTextStyle = TextStyle(fontWeight: FontWeight.w600);
const kBoldTextStyle = TextStyle(fontWeight: FontWeight.w700);
BoxShadow kBasicBoxShadow = BoxShadow(
    color: Colors.black.withOpacity(0.25),
    spreadRadius: 1,
    offset: const Offset(1, 4),
    blurRadius: 4);
InputDecoration kTextFieldInputDecoration = InputDecoration(
  focusColor: kRed,
  hoverColor: kRed,
  contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
  hintText: 'Password',
  hintStyle: kRegularTextStyle.copyWith(color: kGreyText, fontSize: 16),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(
      width: 0,
      style: BorderStyle.none,
    ),
  ),
  filled: true,
  fillColor: kGrey,
);
