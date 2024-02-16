import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/about_us/presentation/screen/about_us_screen.dart';
import 'package:alafein/features/privacy_and_policy/presentation/screen/privacy_and_policy.dart';
import 'package:alafein/features/profile_page/presentation/widgets/profile_item_text.dart';
import 'package:alafein/features/term_conditiom/presentation/screen/term_conditiom.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/local_data/session_management.dart';
import '../../../../core/utility/assets_data.dart';
import '../../../../core/utility/colors_data.dart';
import '../../../../core/utility/strings.dart';

class ThreeItems extends StatelessWidget {
   const ThreeItems({super.key, required this.c});
   final  BuildContext c;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      // Remove the shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: const BorderSide(color: kDividerColor, width: 1.0),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            title: const ProfileItemText(
              text: "About Us",
            ),
            trailing: SvgPicture.asset(AssetsData.arrowRight),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => const AboutUS(),
              ));
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 13),
            child: Divider(
              color: kDividerColor,
            ),
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                title: const ProfileItemText(
                  text: "Privacy Policy",
                ),
            trailing: SvgPicture.asset(AssetsData.arrowRight),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => const PrivacyAndPolicy(),
              ));
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 13),
            child: Divider(
              color: kDividerColor,
            ),
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            title: const ProfileItemText(text: "Terms and Conditions",),
            trailing: SvgPicture.asset(AssetsData.arrowRight),
            onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => const TermCondition(),
              ));
            },
          )
        ],
      ),
    );
  }
}
