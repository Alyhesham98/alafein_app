import 'package:alafein/core/observer.dart';
import 'package:alafein/core/presentation/app_widget.dart';
import 'package:alafein/core/shared/providers.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/features/auth/login/application/cubit/login_cubit.dart';
import 'package:alafein/features/auth/login/application/google_auth_cubit.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/local_data/session_management.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBTDvNMfPQS4cQIUytdrcAKcUeO9OQlcXc",
      appId: "1:92581426653:android:e07557aa0771512396f234",
      messagingSenderId: "messaging id",
      projectId: "alafein-4be65",
    ),
    // options: DefaultFirebaseOptions.currentPlatform,
  );
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
