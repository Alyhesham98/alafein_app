import 'dart:async';

import 'package:alafein/core/debugging/log.dart';
import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(
          seconds: 1,
        ), () {
      if (SessionManagement.getUserToken() != null &&
          SessionManagement.getUserToken()!.isNotEmpty) {
        Log.info("Token : ${SessionManagement.getUserToken()}");
        AutoRouter.of(context).replace(
          OnboardingRoute(route: MainRoute()),
        );
      } else {
        AutoRouter.of(context).replace(
          OnboardingRoute(route: const LoginRoute()),
        );
      }
    });

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Stack(alignment: Alignment.center, children: [
          SvgPicture.asset(AssetsData.logo),
        ]),
      ),
    );
  }
}
