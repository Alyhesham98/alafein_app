import 'dart:developer';
import 'dart:io';
import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/auth/login/application/google_auth_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/presentation/routes/app_router.gr.dart';
import 'Bloc_GSSO/gsso_bloc.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitialState());

  final GoogleSignIn _googleSignIn = Platform.isIOS
      ? GoogleSignIn()
      : GoogleSignIn(
          clientId:
              '587761639039-9j8u9grfd98cajlb0i4p9i0c2aa91s48.apps.googleusercontent.com',
          scopes: [
            'email',
            // 'https://www.googleapis.com/auth/contacts.readonly',
            "https://www.googleapis.com/auth/userinfo.profile",
            'openid',
          ],
        );
  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   clientId: '587761639039-9j8u9grfd98cajlb0i4p9i0c2aa91s48.apps.googleusercontent.com',
  //   scopes: [
  //     'email',
  //     // 'https://www.googleapis.com/auth/contacts.readonly',
  //     "https://www.googleapis.com/auth/userinfo.profile",
  //     'openid',
  //   ],
  // );
  final GSSOBloc gssoBloc = GSSOBloc();

  final _auth = FirebaseAuth.instance;

  void login(BuildContext context) async {
    print("u in login by google function");
    print(
        "================================================================================");
    emit(GoogleAuthLoadingState());
    try {
      // select google account
      final GoogleSignInAccount? userAccont;
      try {
        print("try await signIn");
        userAccont = await _googleSignIn.signIn();
        print("signIn completed: $userAccont");
      } catch (e) {
        print("Error during signIn: $e");
        emit(GoogleAuthFaildState("Error during signIn: $e"));
        return;
      }

      // final GoogleSignInAuthentication? googleSignInAuthentication =
      // await userAccont?.authentication;
      //
      // log("Acccess Token : ${googleSignInAuthentication?.accessToken}");
      // log("idToken : ${googleSignInAuthentication?.idToken}");

      // user dismissed the account dialog
      if (userAccont == null) {
        print("User cancelled the Google sign-in dialog.");
        emit(GoogleAuthFaildState("Cancelled the Google sign-in dialog."));
        return;
      }

      //get authentication object from account
      print("test before auth");
      GoogleSignInAuthentication googleAuth;
      try {
        googleAuth = await userAccont.authentication;
        print(
            "GoogleAuth obtained: accessToken=${googleAuth.accessToken}, idToken=${googleAuth.idToken}");
      } catch (e) {
        print("Error obtaining GoogleAuth: $e");
        emit(GoogleAuthFaildState("Error obtaining GoogleAuth: $e"));
        return;
      }
      print(
          "================================================================================");
      //create OauthCredentials from auth object
      print("create OAuth credentials from auth object");
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print(
          "================================================================================");
      log("create OauthCredentials from auth object:\naccessToken:${googleAuth.accessToken}");
      log("idToken:${googleAuth.idToken}");

      // if (googleAuth.idToken!.isNotEmpty && googleAuth.idToken != null) {
      //   SessionManagement.googleIdToken(googleAuth.idToken!);
      // }
      if (googleAuth.idToken != null && googleAuth.idToken!.isNotEmpty) {
        SessionManagement.googleIdToken(googleAuth.idToken!);
      } else {
        print("Error: idToken is null or empty.");
        emit(GoogleAuthFaildState("Error: idToken is null or empty."));
        return;
      }
      print(
          "================================================================================");

      print("logining to firebase using the Credential");
      try {
        final userCredential =
            await _auth.signInWithCredential(credential).whenComplete(() {
          gssoBloc.add(GSSOInitialEvent(
            accessToken: SessionManagement.getGoogleIdToken() ?? '',
            notificationToken: SessionManagement.getNotificationToken() ?? '',
          ));
        });
        AutoRouter.of(context).replace(OnboardingRoute(route: MainRoute()));
        print(
            "================================================================================");
        print("logining to firebase using the Credential");
        print(
            "================================================================================");

        print("Firebase sign-in successful: $userCredential");
        emit(GoogleAuthSuccessState());
      } catch (e) {
        print("Error during Firebase sign-in: $e");
        emit(GoogleAuthFaildState("Error during Firebase sign-in: $e"));
        return;
      }

      // emit(
      //     GoogleAuthSuccessState(/*userCredential.user! as GoogleLoginState*/));
      print(
          "================================================================================");
      print("Success Credential");
      print(
          "================================================================================");
      // } catch (e) {
      //   emit(GoogleAuthFaildState(e.toString()));
      //   print("Error:$e");
      // }
    } catch (e) {
      print("Unexpected error: $e");
      emit(GoogleAuthFaildState("Unexpected error: $e"));
    }
  }
}
