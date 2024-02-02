import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignupTopCustomText extends StatelessWidget {
  final String title;
  final String? subtitle;
  const SignupTopCustomText({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.anton(
              color: kSemiBlack, fontSize: 6.sw, fontWeight: FontWeight.w400),
        ),
        subtitle == null
            ? const SizedBox()
            : Text(subtitle!, style: secondaryTextStyle),
      ],
    );
  }
}
