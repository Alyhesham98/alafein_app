import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/about_us/presentation/screen/about_us_screen.dart';
import 'package:alafein/features/profile_page/presentation/screen/profile_info/profile_info.dart';
import 'package:alafein/features/profile_page/presentation/widgets/profile_item_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/local_data/session_management.dart';
import '../../../../core/utility/assets_data.dart';
import '../../../../core/utility/colors_data.dart';

import '../../../../core/utility/strings.dart';
import '../../../main/main_screen.dart';

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
      color: Colors.white,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
        title: TextFormField(
          controller: controller,
          // initialValue: title,
          style: personalInfoTextStyle,
          enabled: enabled,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: kDividerColor, width: 1.0),
                borderRadius: BorderRadius.circular(12.0)),
          ),
        ),
      ),
    );
  }
}
