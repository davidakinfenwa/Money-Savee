import 'package:flutter/material.dart';
import 'package:money_saver/core/constant/constant.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor:CustomTypography.kBackgroundColor,
    fontFamily: 'Muli',
    useMaterial3: true,
    appBarTheme: appBarTheme()
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
  );
}