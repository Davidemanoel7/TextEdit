import 'package:flutter/material.dart';

/*
p -> primary
s -> Secondary
t -> toast
*/

class MyColors {

  static const pBlack = Color(0xFF1B1B1B);
  static const pWhite = Color(0xFFF0F0F0);

  static const pBlue = Color(0xFF1F4D60);
  static const pBlueLight = Color(0xFF2D958E);

  static const tGreen = Color(0xFF44BD6E);
  static const tRed = Color(0xFFCD3532);
}

class MyFonts {

  MyFonts._privateConstructor();

  static final style = MyFonts._privateConstructor();

  TextStyle? kLabel(BuildContext context,
          {Color color = MyColors.pBlack, FontWeight fontWeight = FontWeight.bold}) =>
          Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(fontWeight: fontWeight, fontSize: 16, color: color);

  TextStyle? kLabelMedium(BuildContext context,
          {Color color = MyColors.pBlack, FontWeight fontWeight = FontWeight.normal}) =>
          Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(fontWeight: fontWeight, fontSize: 16, color: color);
  
  TextStyle? kLabelSmall(BuildContext context,
          {Color color = MyColors.pBlack, FontWeight fontWeight = FontWeight.normal}) =>
          Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(fontWeight: fontWeight, fontSize: 12, color: color);
}