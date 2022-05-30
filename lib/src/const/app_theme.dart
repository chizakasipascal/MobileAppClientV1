import 'package:flutter/material.dart';
import 'package:mobileappclientv1/src/const/font_family.dart';
import 'package:mobileappclientv1/src/utils/utils.dart';

final ThemeData themeData = ThemeData(
  fontFamily: FontFamily.chevin,
  textTheme: const TextTheme(
    bodyText2: TextStyle(color: kGreyColor, fontSize: 16),
    // bodyLarge: const TextStyle(fontWeight: FontWeight.bold, color: kGreyColor),
  ),
  scaffoldBackgroundColor: Colors.transparent,
  primaryColor: kConnectis,
  splashColor: kConnectis.withOpacity(.5),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: kConnectis,
    selectionColor: kConnectis,
    selectionHandleColor: kConnectis,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(kConnectis),
      foregroundColor: MaterialStateProperty.all(kWhiteColor),
      overlayColor: MaterialStateProperty.all(kGreyColor),
      shadowColor: MaterialStateProperty.all(kBlackColor),
      elevation: MaterialStateProperty.all(15),
      padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
      maximumSize: MaterialStateProperty.all(const Size(200, 40)),
      minimumSize: MaterialStateProperty.all(const Size(100, 40)),
      fixedSize: MaterialStateProperty.all(const Size(200, 40)),
      animationDuration: const Duration(milliseconds: 100),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      side: MaterialStateProperty.all(
        const BorderSide(
          color: kConnectis,
          width: 2,
        ),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 16,
          color: kWhiteColor,
        ),
      ),
    ),
  ),
);
