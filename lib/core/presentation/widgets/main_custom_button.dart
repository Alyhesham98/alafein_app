import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

class MainCustomButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onPressed;
  final Color? backgroundColor;
  const MainCustomButton(
      {super.key,
      required this.buttonName,
      required this.onPressed,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {

    return MaterialButton(
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      disabledColor: kHintColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: onPressed,
      color: backgroundColor ?? kPrimaryColor,
      textColor: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 8.sw,
        vertical: 4.sw,
      ),
      child: Row(
        children: [
          const Spacer(),
          Text(
            buttonName,
            style: GoogleFonts.plusJakartaSans(
                fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          // SvgPicture.asset(AssetsData.forward),
          const Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
