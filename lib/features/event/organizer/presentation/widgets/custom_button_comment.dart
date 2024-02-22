import 'package:alafein/core/utility/colors_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomButtonComment extends StatelessWidget {
  const CustomButtonComment({
    super.key,
    this.color,
    this.textColor,
    required this.data,
    this.borderColor,
    required this.onTap,

  });
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final Function? onTap;

  final String data;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      disabledColor: kHintColor,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor ?? kPrimaryColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      onPressed: (){
        onTap!();
      },
      color: color ?? Colors.white,
      textColor: textColor ?? kPrimaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: 8.sw,
        vertical: 4.sw,
      ),
      child: Text(
        data,
        style: GoogleFonts.anton(fontSize: 4.2.sw, fontWeight: FontWeight.w400),
      ),
    );
  }
}
