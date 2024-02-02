import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

final themeData = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true),
  timePickerTheme: _timePickerTheme,
  scaffoldBackgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: const MaterialStatePropertyAll(0),
      backgroundColor: const MaterialStatePropertyAll(Colors.white),
      foregroundColor: const MaterialStatePropertyAll(Colors.black),
      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
      shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
          side: const BorderSide(), borderRadius: BorderRadius.circular(7.sw))),
    ),
  ),
);

final textFormFieldBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(width: 1.5, color: kDividerColor),
);

final linkStyle = TextStyle(
    fontFamily: StringConst.formulaFont,
    color: kPrimaryColor,
    fontSize: 3.sw,
    fontWeight: FontWeight.w300);

final termsTextStyle = TextStyle(
    fontFamily: StringConst.formulaFont,
    color: kGreyFontColor,
    fontSize: 3.sw,
    fontWeight: FontWeight.w300);

final secondaryTextStyle = TextStyle(
    fontFamily: StringConst.formulaFont,
    color: kGreyFontColor,
    fontSize: 4.sw,
    fontWeight: FontWeight.w300);

const labelStyle = TextStyle(
    color: kHintColor,
    fontFamily: StringConst.formulaFont,
    fontWeight: FontWeight.w300);

final appBarTextStyle = GoogleFonts.abhayaLibre(
  fontSize: 4.sw,
  fontWeight: FontWeight.w700,
);
const homeLabelStyle = TextStyle(
  color: kSemiBlack,
  fontSize: 24,
  fontFamily: StringConst.formulaFont,
  fontWeight: FontWeight.bold,
);

const homeLabel2Style = TextStyle(
  color: kSemiBlack,
  fontSize: 20,
  fontFamily: StringConst.formulaFont,
  fontWeight: FontWeight.bold,
);

const homeLabel3Style = TextStyle(
  color: kSemiBlack,
  fontSize: 14,
  fontFamily: StringConst.formulaFont,
  fontWeight: FontWeight.bold,
);

const eventcomment = TextStyle(
  color: kSemiBlack,
  fontSize: 14,
  fontFamily: StringConst.formulaFont,
  fontWeight: FontWeight.w300,
);

final _timePickerTheme = TimePickerThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
    dayPeriodColor: MaterialStateColor.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return kSecondaryColor;
        } else {
          return kHintColor.withOpacity(0.25);
        }
      },
    ),
    dialTextColor: MaterialStateColor.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        } else {
          return Colors.black;
        }
      },
    ),
    dayPeriodTextColor: MaterialStateColor.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        } else {
          return Colors.black;
        }
      },
    ),
    hourMinuteTextColor: MaterialStateColor.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        } else {
          return Colors.black;
        }
      },
    ),
    hourMinuteColor: MaterialStateColor.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return kPrimaryColor;
        } else {
          return kHintColor.withOpacity(0.25);
        }
      },
    ),
    dialHandColor: kPrimaryColor,
    dialBackgroundColor: kHintColor.withOpacity(0.25));
