import 'package:alafein/core/utility/colors_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLoginMainText extends StatelessWidget {
  final String text;
  const CustomLoginMainText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Let's Check if you have an account".tr(),
          style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w500,
              color: kSecondaryFontColor,
              fontSize: 14),
        ),
      ],
    );
  }
}
