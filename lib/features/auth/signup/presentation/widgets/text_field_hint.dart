import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TextFieldHint extends StatelessWidget {
  final String hint;
  const TextFieldHint({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Text(
      hint,
      style: TextStyle(
          fontFamily: StringConst.formulaFont,
          fontWeight: FontWeight.w300,
          fontSize: 3.sw,
          color: kHintColor),
    );
  }
}
