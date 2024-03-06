import 'package:alafein/core/observer.dart';
import 'package:alafein/core/presentation/app_widget.dart';
import 'package:alafein/core/shared/providers.dart';
import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/features/auth/login/application/cubit/login_cubit.dart';
import 'package:alafein/features/auth/login/application/google_auth_cubit.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/local_data/session_management.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/utility/CustomLoader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDWtGpWFRGcb7EQM_T7nNrlM2ad-dTj1kQ",
      appId: "1:587761639039:android:230c35dde1a21f7629a94a",
      messagingSenderId: "messaging id",
      projectId: "alafein",
      androidClientId: "587761639039-nme8uh34kc0h86eklfmpa7rpaerofkkv.apps.googleusercontent.com"
    ),
  );
  callFirebase();
  await SessionManagement.init();
  configLoading();
  Bloc.observer = MyBlocObserver();

  initLocator();
  runApp(MultiBlocProvider(
    providers: [
      //////////
      BlocProvider(
        create: (context) => GoogleAuthCubit(),
      ),
      //////////
      BlocProvider(
        create: (context) => SignupCubit(),
      ),
      BlocProvider(
        create: (context) => LoginCubit(),
      ),
    ],
    child: const AppWidget(),
  ));
}

callFirebase() async {
  try {
    await FirebaseMessaging.instance
        .requestPermission(alert: true, announcement: true, sound: true);
  await  FirebaseMessaging.instance.getToken().then((value) {
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
    ..customAnimation=  CustomLoader()
    ..indicatorWidget = SizedBox(width:150,height:150,child: Image.asset(AssetsData.animatedLoading))
    ..infoWidget = SizedBox(width:150,height:150,child: Image.asset(AssetsData.animatedLoading))
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
