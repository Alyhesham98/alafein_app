import 'package:alafein/core/utility/assets_data.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class YouAreAllSetPage extends StatelessWidget {
  final PageRouteInfo<dynamic> route;
  const YouAreAllSetPage({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 6000), () {
      AutoRouter.of(context).replaceAll([route]);
    });
    return FittedBox(
      fit: BoxFit.cover,
      child: Center(
        child: Image.asset(AssetsData.youAreAllSet),
      ),
    );
  }
}
