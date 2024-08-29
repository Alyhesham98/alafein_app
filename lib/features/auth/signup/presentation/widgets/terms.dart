import 'package:alafein/core/utility/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Terms extends StatelessWidget {
  const Terms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 81.sw,
      child: Text.rich(
        TextSpan(
          style: termsTextStyle,
          text: 'By selecting agree and continue, i agree with Alafein terms of service, payments terms of service and nondiscrimination policy and acknowledge the privacy policy'.tr(),
          children: [
            // TextSpan(
            //   text: 'Terms of Service, Payments Terms of Service',
            //   recognizer: TapGestureRecognizer()
            //     ..onTap = () {
            //       //TODO: Terms of Service Link
            //     },
            //   style: linkStyle,
            // ),
            // TextSpan(
            //   text: ' and ',
            //   style: termsTextStyle,
            // ),
            // TextSpan(
            //   text: 'Nondiscrimination Policy',
            //   recognizer: TapGestureRecognizer()
            //     ..onTap = () {
            //       //TODO: Privacy Policy Link
            //     },
            //   style: linkStyle,
            // ),
            // TextSpan(
            //   text: ' and acknowledge the ',
            //   style: termsTextStyle,
            // ),
            // TextSpan(
            //   text: 'y',
            //   recognizer: TapGestureRecognizer()
            //     ..onTap = () {
            //       //TODO: Privacy Policy Link
            //     },
            //   style: linkStyle,
            // ),
          ],
        ),
      ),
    );
  }
}
