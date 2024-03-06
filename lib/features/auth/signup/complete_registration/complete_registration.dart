import 'package:alafein/features/auth/login/presentation/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utility/theme.dart';

class CompleteRegistration extends StatefulWidget {
  const CompleteRegistration({super.key});

  @override
  State<CompleteRegistration> createState() => _CompleteRegistrationState();
}

class _CompleteRegistrationState extends State<CompleteRegistration> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()))});
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Align(alignment: Alignment.center,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Congratulations',
                style: personalInfoLabelPrimary.merge(const TextStyle(fontSize: 24)),
                textAlign: TextAlign.center,
              ),
              Text('You have completed your profile the AlaFein team will get back to you with confirmation .',
                  style: descTextGrayStyle.merge(const TextStyle(fontSize: 18)), textAlign: TextAlign.center)
            ]),
          ),
        ),
      );
}
