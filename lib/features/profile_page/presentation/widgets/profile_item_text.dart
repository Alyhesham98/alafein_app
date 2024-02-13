import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/local_data/session_management.dart';
import '../../../../core/utility/assets_data.dart';
import '../../../../core/utility/colors_data.dart';
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
