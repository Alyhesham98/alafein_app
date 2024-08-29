import 'package:alafein/core/presentation/routes/app_router.dart';
import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(builder: (context) {
      return MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        // routerDelegate: AutoRouterDelegate(AppRouterSingleton().appRouter),
        // routeInformationParser: AppRouterSingleton().appRouter.defaultRouteParser(),
        builder: EasyLoading.init(
          builder: (context, child) {
            return child!;
          },
        ),
        debugShowCheckedModeBanner: false,
        title: StringConst.appName,
        theme: themeData,
        routerConfig: AppRouterSingleton().appRouter.config(
          deepLinkBuilder: (deepLink) {
            print('deepLink: $deepLink');
            if (deepLink.path.startsWith('/event_details_route')) {
              AutoRouter.of(context).popAndPush(EventDeatilsPage(
                  index: int.parse(deepLink.path.split(":").last)));
              print("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
              return deepLink;
            } else {
              return DeepLink.defaultPath;
            }
          },
        ),
      );
    });
  }
}
