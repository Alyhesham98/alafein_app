import 'dart:convert';

import 'package:alafein/core/observer.dart';
import 'package:alafein/core/presentation/app_widget.dart';
import 'package:alafein/core/shared/providers.dart';
import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/features/auth/login/application/cubit/login_cubit.dart';
import 'package:alafein/features/auth/login/application/google_auth_cubit.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/local_data/session_management.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/presentation/routes/app_router.dart';
import 'core/presentation/routes/app_router.gr.dart';
import 'firebase_options.dart';
import 'package:http/http.dart' as http;

import 'core/utility/CustomLoader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  callFirebase();

  // Ensure session initialization before token check
  await SessionManagement.init();

  await _checkAndRefreshToken();

  configLoading();
  Bloc.observer = MyBlocObserver();

  initLocator();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GoogleAuthCubit(),
          ),
          BlocProvider(
            create: (context) => SignupCubit(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
        ],
        child: const AppWidget(),
      ),
    ),
  );
}

callFirebase() async {
  final _firebaseMessaging = FirebaseMessaging.instance;

  await _firebaseMessaging.requestPermission(
      alert: true, announcement: true, sound: true);

  final token = await _firebaseMessaging.getToken();

  print('Token Main ${token}');
  try {
    await FirebaseMessaging.instance
        .requestPermission(alert: true, announcement: true, sound: true);
    await FirebaseMessaging.instance.getToken().then((value) {
      if (kDebugMode) {
        print("DeviceToken:$value");
      }
      SessionManagement.notificationToken(value ?? '');
    });
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (kDebugMode) {
        print(message!.data);
      }
      if (kDebugMode) {
        print(message?.messageId);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      if (kDebugMode) {
        print("onMessageOpenedApp: $message");
      }
    });
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..customAnimation = CustomLoader()
    ..indicatorWidget = SizedBox(
        width: 150, height: 150, child: Image.asset(AssetsData.animatedLoading))
    ..infoWidget = SizedBox(
        width: 150, height: 150, child: Image.asset(AssetsData.animatedLoading))
    ..indicatorSize = 60
    ..indicatorColor = kPrimaryColor
    ..contentPadding = const EdgeInsets.symmetric(vertical: 12)
    ..displayDuration = const Duration(milliseconds: 1400)
    ..radius = 10.0
    ..progressColor = kPrimaryColor
    ..backgroundColor = Colors.transparent
    ..textColor = Colors.white
    ..maskType = EasyLoadingMaskType.black
    ..userInteractions = false
    ..animationDuration = const Duration(milliseconds: 350)
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale
    ..boxShadow = <BoxShadow>[];
}

//
// Future<void> _checkAndRefreshToken() async {
//   print('_checkAndRefreshToken token');
//   final tokenExpiration = SessionManagement.getTokenExpiration();
//   final currToken = SessionManagement.getUserToken();
//   print('The current user token is: $currToken');
//   print('The current token expiration is: $tokenExpiration');
//
//   final now = DateTime.now();
//
//   if (tokenExpiration == null || now.isAfter(tokenExpiration)) {
//     // Token has expired or no expiration time set, attempt to refresh
//     final success = await _refreshToken();
//     if (success) {
//       print('Refreshed Token Successfully');
//     } else {
//       print('ERROR: Refreshed Token FAILED');
//       _handleSessionExpired(); // Handle session expiration
//     }
//   } else {
//     final difference = tokenExpiration.difference(now);
//     // Check if the token expires in less than 3 days
//     if (difference.inDays < 3) {
//       final success = await _refreshToken();
//       if (success) {
//         print('Refreshed Token Successfully');
//       } else {
//         print('ERROR: Refreshed Token FAILED');
//         _handleSessionExpired(); // Handle session expiration
//       }
//     } else {
//       print('No need to refresh token');
//     }
//   }
// }
//
// Future<bool> _refreshToken() async {
//   final currentToken = SessionManagement.getUserToken();
//   if (currentToken == null || currentToken.isEmpty) {
//     print('ERROR: No current token available for refresh');
//     return false;
//   }
//
//   final url =
//   Uri.parse('https://alafein.azurewebsites.net/api/v1/User/RefreshToken');
//
//   try {
//     final response = await http.post(
//       url,
//       headers: {
//         "Content-Type": "application/json-patch+json",
//         "Authorization": "Bearer $currentToken"
//       },
//       body: jsonEncode({"token": currentToken}),
//     );
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body)['data'];
//       if (data != null) {
//         final newToken = data['jwtToken'] ?? '';
//         final role = data['role'] ?? '';
//         final newTokenExpiration = data['tokenExpiration'] ?? '';
//
//         if (newToken.isNotEmpty && newTokenExpiration.isNotEmpty) {
//           SessionManagement.createSession(
//             token: newToken,
//             role: role,
//             tokenExpiration: newTokenExpiration,
//           );
//           SessionManagement.saveTokenExpiration(
//               DateTime.parse(newTokenExpiration));
//           return true;
//         } else {
//           print('ERROR: Invalid data received from token refresh response');
//           return false;
//         }
//       } else {
//         print('ERROR: No data found in response');
//         return false;
//       }
//     } else {
//       print(
//           'ERROR: Failed to refresh token, status code ${response.statusCode}');
//       return false;
//     }
//   } catch (e) {
//     print('ERROR: Exception occurred during token refresh: $e');
//     return false;
//   }
// }

// Function to handle session expiration
// void _handleSessionExpired() {
//   // Clear the session and token
//   SessionManagement.signOut();
//
//   // Redirect to the login page
//   AutoRouter.of(context).replaceAll([const LoginRoute()]);
// }
//

Future<void> _checkAndRefreshToken() async {
  final currToken = SessionManagement.getUserToken();

  print('Checking token: $currToken');

  if (currToken == null || currToken.isEmpty) {
    print('ERROR: No token available. Redirecting to login.');
    _handleSessionExpired();
    return;
  }

  final url = Uri.parse(
      'https://alafein.azurewebsites.net/api/v1/Event/GetCategories?isAscending=false');

  try {
    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $currToken",
        "Content-Type": "application/json",
      },
    );

    print('Token validation response: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('Token is valid.');
    } else if (response.statusCode == 401) {
      print('Unauthorized access, refreshing token...');
      final success = await _refreshToken();
      if (success) {
        print('Refreshed Token Successfully');
      } else {
        print('ERROR: Refresh Token FAILED, logging out.');
        _handleSessionExpired();
      }
    } else {
      print('Unexpected API response: ${response.statusCode}');
    }
  } catch (e) {
    print('ERROR: Exception occurred during token verification: $e');
    _handleSessionExpired();
  }
}

Future<bool> _refreshToken() async {
  final currentToken = SessionManagement.getUserToken();
  if (currentToken == null || currentToken.isEmpty) {
    print('ERROR: No current token available for refresh');
    return false;
  }

  final url =
      Uri.parse('https://alafein.azurewebsites.net/api/v1/User/RefreshToken');

  try {
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $currentToken"
      },
      body: jsonEncode({"token": currentToken}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      if (data != null) {
        final newToken = data['jwtToken'] ?? '';
        final role = data['role'] ?? '';
        final newTokenExpiration = data['tokenExpiration'] ?? '';

        if (newToken.isNotEmpty && newTokenExpiration.isNotEmpty) {
          await SessionManagement.updateSessionToken(
              newToken, DateTime.parse(newTokenExpiration));
          print('Token successfully updated.');
          return true;
        } else {
          print('ERROR: Invalid data received from token refresh response');
          return false;
        }
      } else {
        print('ERROR: No data found in response');
        return false;
      }
    } else {
      print(
          'ERROR: Failed to refresh token, status code ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('ERROR: Exception occurred during token refresh: $e');
    return false;
  }
}


void _handleSessionExpired() {
  print('Handling session expiration - checking before clearing token.');

  final currentToken = SessionManagement.getUserToken();
  if (currentToken == null || currentToken.isEmpty) {
    print('Token already missing, skipping sign out.');
  } else {
    print('Clearing expired token only.');
    SessionManagement.box.delete(SessionManagement.TOKEN_KEY);
    SessionManagement.box.delete(SessionManagement.TOKEN_EXPIRATION_KEY);
  }

  // Redirect to login only if the user is actually logged out
  AppRouterSingleton().appRouter.replaceAll([const LoginRoute()]);
}