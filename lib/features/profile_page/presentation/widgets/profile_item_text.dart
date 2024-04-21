import 'package:flutter/material.dart';

import '../../../../core/utility/strings.dart';

class ProfileItemText extends StatelessWidget {
  const ProfileItemText(
      {super.key, required this.text, this.textColor = Colors.black});

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
          color: textColor,
          fontFamily: StringConst.formulaFont,
          fontWeight: FontWeight.w300,
          fontSize: 16),
    );
  }
}
