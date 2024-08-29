import 'package:alafein/features/auth/login/presentation/login_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/utility/theme.dart';

class CompleteRegistration extends StatefulWidget {
  const CompleteRegistration({super.key});

  @override
  State<CompleteRegistration> createState() => _CompleteRegistrationState();
}

class _CompleteRegistrationState extends State<CompleteRegistration> {
  bool _showGif = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 73), () {
      setState(() {
        _showGif = false;
      });

      Future.delayed(
          const Duration(seconds: 2),
          () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginPage()))
              });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _showGif
            ? SizedBox.expand(
                child: Image.asset(
                  'assets/images/Motion Graphics/all-set/gif/all-set.gif',
                  fit: BoxFit.cover,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Congratulations',
                      style: personalInfoLabelPrimary.merge(
                        const TextStyle(fontSize: 24),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'You have completed your profile. The AlaFein team will get back to you with confirmation.',
                      style: descTextGrayStyle.merge(
                        const TextStyle(fontSize: 18),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
