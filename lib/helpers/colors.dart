import 'package:flutter/material.dart';

const Color kColorBackground = Color(0xFF03001e);
const Color kColorBackground02 = Color(0xFF26243a);
const Color kColorDark = Colors.black45;
Color kColorGrey01 = Colors.grey.shade300.withOpacity(.7);
Color kColorGrey02 = const Color(0xFFf2f6f9).withOpacity(.8);

const Color kColorOrange = Color(0xFFfeac5e);
Color kColorOrange02 = kColorOrange.withOpacity(.5);
const Color kPurple01 = Color(0xFFc779d0);
const Color kPurple02 = Color(0xFF653d76);
const Color kPurple03 = Color(0xFF1e1535);
const Color kChibi = Color(0xFF4bc0c8);
const Color kChibi03 = Color(0xFF20bdff);
const Color kChibi04 = Color(0xFFa5fecb);
Color kChibi02 = kChibi.withOpacity(.6);

List<Color> colorizeColors = [kColorOrange, kPurple01, kChibi];

List<BoxShadow> kGradientCirclePic1 = [
  BoxShadow(
    color: Colors.white,
    blurRadius: 2,
    offset: Offset(0, 0),
  ),
  BoxShadow(
    color: kChibi.withOpacity(.3),
    blurRadius: 30,
    offset: Offset(30, 30),
  ),
  BoxShadow(
    color: kColorOrange.withOpacity(.3),
    blurRadius: 30,
    offset: Offset(1, 1),
  ),
  BoxShadow(
    color: kPurple01.withOpacity(.3),
    blurRadius: 30,
    offset: Offset(-30, -30),
  ),
];
List<BoxShadow> kGradientCirclePic2 = [
  BoxShadow(
    color: kChibi.withOpacity(.3),
    blurRadius: 5,
    offset: Offset(5, 5),
  ),
  BoxShadow(
    color: kColorOrange.withOpacity(.3),
    blurRadius: 5,
    offset: Offset(1, 1),
  ),
  BoxShadow(
    color: kPurple01.withOpacity(.3),
    blurRadius: 5,
    offset: Offset(-1, -1),
  ),
];
