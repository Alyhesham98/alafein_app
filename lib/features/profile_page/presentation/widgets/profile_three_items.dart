import 'package:alafein/features/about_us/presentation/screen/about_us_screen.dart';
import 'package:alafein/features/privacy_and_policy/presentation/screen/privacy_and_policy.dart';
import 'package:alafein/features/profile_page/presentation/widgets/profile_item_text.dart';
import 'package:alafein/features/term_conditiom/presentation/screen/term_conditiom.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/utility/assets_data.dart';
import '../../../../core/utility/colors_data.dart';

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
            title: ProfileItemText(
              text: "About Us".tr(),
            ),
            trailing:const Icon(Icons.arrow_forward_ios, size: 10, weight: 900,),
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
                title:  ProfileItemText(
                  text: "Privacy Policy".tr().toUpperCase(),
                ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 10, weight: 900,),
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
            title: ProfileItemText(text: "Terms and Conditions".tr(),),
            trailing: const Icon(Icons.arrow_forward_ios, size: 10, weight: 900,),
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
