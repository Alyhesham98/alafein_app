import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF0000F5);
const kSecondaryColor = Color(0xFFff73c6);
const kGreyFontColor = Color(0xFF464646);
const kSecondaryFontColor = Color(0xFF727272);
const kHintColor = Color(0xFFBDBDBD);
const kPersonGreyColor = Color(0xFF5f5f5f);
const kDividerColor = Color(0xFFECECEC);
const kSemiBlack = Color(0xFF292929);
const kTealColor = Color(0xFF9AE0DF);
const kProfilePicBackgroundColor = Color(0xFFEDEDED);

ColorFilter kColorFilter(Color color) {
  return ColorFilter.mode(color, BlendMode.srcATop);
}
