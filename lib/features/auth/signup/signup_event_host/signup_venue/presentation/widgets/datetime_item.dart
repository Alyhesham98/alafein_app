import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TimeItem extends StatelessWidget {
  final TimeOfDay? time;
  final String label;
  const TimeItem({
    super.key,
    required this.time,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.sw),
      height: 14.sw,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5.sw),
          border: Border.all(color: kDividerColor, width: 1.5)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          label,
          style: const TextStyle(
              color: kHintColor,
              fontFamily: StringConst.formulaFont,
              fontWeight: FontWeight.w300),
        ),
        Text(
          time == null
              ? "00:00"
              : "${(time!.hourOfPeriod.toString().padLeft(2, "0"))}:${(time!.minute.toString().padLeft(2, "0"))} ${(time!.hour > 12 ? "PM" : "AM")}",
          style: GoogleFonts.anton(
              color: kSemiBlack, fontSize: 4.sw, fontWeight: FontWeight.w400),
        ),
      ]),
    );
  }
}
