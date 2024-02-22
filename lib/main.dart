import 'package:alafein/core/observer.dart';
import 'package:alafein/core/presentation/app_widget.dart';
import 'package:alafein/core/shared/providers.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDWtGpWFRGcb7EQM_T7nNrlM2ad-dTj1kQ",
      appId: "1:587761639039:android:02750868d015c7b629a94a",
      messagingSenderId: "messaging id",
      projectId: "alafein",
    ),
    // options: DefaultFirebaseOptions.currentPlatform,
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
    FirebaseMessaging.instance
        .getToken()
        .then((value) => print("DeviceToken:${value}"));/*SharedPRefHelper().setSetDeviceToken(value.toString()))*/
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );



    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      print(message!.data);
      print(message.messageId);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("onMessageOpenedApp: $message");
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
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..indicatorSize = 60
    ..indicatorColor = kPrimaryColor
    ..contentPadding = const EdgeInsets.all(12)
    ..displayDuration = const Duration(milliseconds: 1400)
    ..radius = 10.0
    ..progressColor = kPrimaryColor
    ..backgroundColor = Colors.white
    ..textColor = Colors.black
    ..maskColor = kPrimaryColor
    ..maskType = EasyLoadingMaskType.clear
    ..userInteractions = false
    ..animationDuration = const Duration(milliseconds: 350)
    ..dismissOnTap = false;
}
