import 'dart:convert';
import 'package:alafein/core/presentation/routes/app_router.dart';
import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:http/http.dart' as http;
import '../../features/event/organizer/presentation/model/event_data_ui_model.dart';
import '../local_data/session_management.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  static Future<List<EventDataUiModel>> fetchEvent(BuildContext context) async {
    var client = http.Client();
    List<EventDataUiModel> events = [];

    try {
      print("Running API call");

      var response = await client.get(
        Uri.parse(
            'https://alafein.azurewebsites.net/api/v1/Event/GetCategories?isAscending=false'),
        headers: {
          "Authorization": "Bearer ${SessionManagement.getUserToken()}"
        },
      );

      // Check if the status code is not 200
      if (response.statusCode != 200) {
        print("API call failed with status code: ${response.statusCode}");
        // Sign out and redirect to login page
        SessionManagement.signOut();
        AppRouterSingleton().appRouter.replaceAll([const LoginRoute()]);
        return []; // Return an empty list to indicate failure
      }
      print("Success ${response.statusCode}");

      return [];
    } catch (e) {
      print("Error fetching events: $e");
      SessionManagement.signOut();
      AppRouterSingleton().appRouter.replaceAll([const LoginRoute()]);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(builder: (context) {
      return MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: EasyLoading.init(
          builder: (context, child) {
            return child!;
          },
        ),
        debugShowCheckedModeBanner: false,
        title: StringConst.appName,
        theme: themeData,
        routerConfig: AppRouterSingleton().appRouter.config(
          deepLinkBuilder: (deepLink) async {
            print('deepLink:2 $deepLink');

            // Check if deep link starts with the expected path for event details
            if (deepLink.path.startsWith('/event_details_route')) {
              final eventId = int.tryParse(deepLink.path.split(":").last);

              if (eventId != null) {
                // Navigate to EventDetailsPage with the parsed event index
                AppRouterSingleton()
                    .appRouter
                    .popAndPush(EventDeatilsPage(index: eventId));
                print(
                    "Navigating to Event Details Page with event ID: $eventId");
                return deepLink;
              } else {
                print('Invalid event ID in the deep link');
              }
            }

            // If the path doesn't match or deep link is invalid, sign out and navigate to LoginRoute
            print('Invalid deep link, redirecting to login page');
            await fetchEvent(context);
            // SessionManagement.signOut();
            //
            // // Replace all routes with the LoginRoute
            // AppRouterSingleton().appRouter.replaceAll([const LoginRoute()]);

            // Return a default path (or null) to prevent further deep link handling
            return DeepLink.defaultPath;
          },
        ),
      );
    });
  }
}
