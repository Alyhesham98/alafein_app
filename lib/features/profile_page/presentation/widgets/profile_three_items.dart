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
            title: const Text(
              "About Us",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: StringConst.formulaFont,
                  fontWeight: FontWeight.w300,
                  fontSize: 16),
            ),
            trailing: SvgPicture.asset(AssetsData.arrowRight),
            onTap: () {
              AutoRouter.of(context).replaceAll([const LoginRoute()]);

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
            title: const Text(
              "Privacy Policy",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: StringConst.formulaFont,
                  fontWeight: FontWeight.w300,
                  fontSize: 16),
            ),
            trailing: SvgPicture.asset(AssetsData.arrowRight),
            onTap: () {
              AutoRouter.of(context).replaceAll([const LoginRoute()]);

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
            title: const Text(
              "Terms and Conditions",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: StringConst.formulaFont,
                  fontWeight: FontWeight.w300,
                  fontSize: 16),
            ),
            trailing: SvgPicture.asset(AssetsData.arrowRight),
            onTap: () {
              AutoRouter.of(context).replaceAll([const LoginRoute()]);
            },
          )
        ],
      ),
    );
  }
}
