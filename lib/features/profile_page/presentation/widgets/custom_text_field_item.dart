import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utility/colors_data.dart';


class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.title,
    required this.controller,
    required this.enabled,
  });

  final String title;
  final bool enabled;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        title: TextFormField(
          controller: controller,
          // initialValue: title,
          style: personalInfoTextStyle,
          enabled: enabled,
          cursorColor: kPrimaryColor,
          maxLines: null,
          decoration: InputDecoration(
            focusedBorder:  OutlineInputBorder(
                borderSide: const BorderSide(color: kPrimaryColor, width: 1.0),
                borderRadius: BorderRadius.circular(12.0)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: kDividerColor, width: 1.0),
                borderRadius: BorderRadius.circular(12.0)),
          ),
        ),
      ),
    );
  }
}
