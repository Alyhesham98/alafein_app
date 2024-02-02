import 'package:alafein/core/utility/assets_data.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  final PageRouteInfo<dynamic> route;
  const OnboardingPage({super.key, required this.route});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(
          seconds: 4,
        ), () {
      AutoRouter.of(context).replace(
        widget.route,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(AssetsData.onboardIcon),
            Image.asset(AssetsData.animatedLogo),
          ],
        ),
      ),
    );
  }
}
