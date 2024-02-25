
import 'dart:developer';

import 'package:alafein/features/auth/login/application/Bloc/google_login_state.dart';
import 'package:alafein/features/auth/login/application/google_auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState>{
  GoogleAuthCubit() : super(GoogleAuthInitialState());

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final _auth = FirebaseAuth.instance;
  final _auth = FirebaseAuth.instance;

  void login() async {
    print("u in login by google function");
    print("================================================================================");
    emit(GoogleAuthLoadingState());
    try{ 
      // select google account
      final userAccont = await _googleSignIn.signIn();
      
      // user dismissed the account dilog
      if(userAccont == null) return;

      //get authentication object from account
      final GoogleSignInAuthentication googleAuth = await userAccont.authentication;
      print("================================================================================");
      print("get authentication object from account");
      print("================================================================================");
      //create OauthCredentials from auth object
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      print("================================================================================");
      print("create OauthCredentials from auth object:accessToken:${googleAuth.accessToken}");
      log("create OauthCredentials from auth object:idToken:${googleAuth.idToken}");
      print("================================================================================");

      //login to firebase using the Credential
      final userCredential = await _auth.signInWithCredential(credential);
      print("================================================================================");
      print("logining to firebase using the Credential");
      print("================================================================================");


      emit(GoogleAuthSuccessState(userCredential.user! as GoogleLoginStatus));
      print("================================================================================");
      print("Success Credential");
      print("================================================================================");
      
    }catch(e){
      emit(GoogleAuthFaildState(e.toString()));
      print("Eroor:"+e.toString());
    }
  }

}