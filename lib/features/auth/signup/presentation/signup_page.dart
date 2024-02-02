import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/presentation/widgets/main_custom_button.dart';
import 'package:alafein/features/auth/signup/presentation/signup_body.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

@RoutePage()
class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.sw),
          child: const SignupBody(),
          // child: Stack(
          //   children: [
          //     const SignupBody(),
          //     // Align(
          //     //   alignment: Alignment.bottomCenter,
          //     //   child: Padding(
          //     //     padding: EdgeInsets.only(bottom: 4.sw),
          //     //     child: MainCustomButton(
          //     //       buttonName: 'Next',
          //     //       onPressed: () {
          //     //         AutoRouter.of(context)
          //     //             .push(const SignupTypeSelectorRoute());
          //     //       },
          //     //     ),
          //     //   ),
          //     // ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
