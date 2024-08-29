import 'dart:convert';
import 'dart:math';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'package:alafein/features/auth/login/application/repo/gsso_repo.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../core/api/api_caller.dart';
import '../../../../core/api/constants/endpoints.dart';
import '../../../../core/api/constants/methods.dart';
import '../../../../core/presentation/routes/app_router.gr.dart';
import '../../signup/application/signup_cubit/signup_cubit.dart';
import '../../signup/complete_registration/complete_registration.dart';
import '../../signup/model/registration_user_model.dart';

String generateNonce([int length = 32]) {
  const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}

String sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256.convert(bytes);
  return digest.toString();
}

Future<void> signInWithApple(BuildContext context) async {
  late RegistrationUserModel _userModel;

  try {
    String clientID = 'com.alafeinteam.alafein-service';

    String redirectURL =
        'https://intermediate-nice-airbus.glitch.me/callbacks/sign_in_with_apple';

    final rawNonce = generateNonce();

    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: Platform.isIOS ? nonce : null,
      webAuthenticationOptions: Platform.isIOS
          ? null
          : WebAuthenticationOptions(
              clientId: clientID,
              redirectUri: Uri.parse(redirectURL),
            ),
    );
    // Print the entire appleCredential for debugging
    print('Apple Credential: ${appleCredential}');

    final AuthCredential appleAuthCredential =
        OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      rawNonce: Platform.isIOS ? rawNonce : null,
      accessToken: Platform.isIOS ? null : appleCredential.authorizationCode,
    );

    print('AUTH credentials apple: ${appleAuthCredential}');
    print('ID Token APPLE: ${appleCredential.identityToken}');

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(appleAuthCredential);
    print('user credentials apple: ${userCredential}');

    // Extract email and full name
    String? email = appleCredential.email;
    String? firstName = appleCredential.givenName;
    String? lastName = appleCredential.familyName;

    _userModel = RegistrationUserModel(
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      email: email ?? '',
      password: 'Alafein2024##',
      profilePicture: "",
      roleId: "roleId",
    );

    Map<String, dynamic> _signupData() {

        return {
          "user": _userModel.toJson(),
          "organizer": null,
          "venue": null,
      };
    }

    final APICaller _apiCaller = APICaller.instance;
    AutoRouter.of(context).replaceAll([MainRoute()]); //temp

    if (firstName != null && lastName != null && email != null)
    {

      print('Full Name: $firstName $lastName');

      final call = await _apiCaller.call(
        endpoint: Endpoints.register,
        method: APIMethods.post,
        data: _signupData(),
      );
      call.fold(
            (failure) {
          EasyLoading.showError(failure.toString());

        },
            (response) {
          if (response.succeeded == true) {
            EasyLoading.dismiss();

            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CompleteRegistration()));
        } }
      );
    } else {
      print('Full Name is null');
    }

    final profileData = userCredential.additionalUserInfo?.profile;
    if (profileData != null) {
      print('Profile Data: $profileData');
    } else {
      print('Profile Data is null');
    }

    // Handle additional user info and authorization code if needed
    String? authorizationCode = appleCredential.authorizationCode;
    if (authorizationCode == null) {
      AutoRouter.of(context).replaceAll([MainRoute()]); //temp
      print('Error: authorizationCode is null');
      return;
    }

    // If you need to send the authorization code to your server for further processing
    // final signInWithAppleEndpoint = Uri(
    //   scheme: 'https',
    //   host: 'https://intermediate-nice-airbus.glitch.me/callbacks/sign_in_with_apple',
    //   path: '/sign_in_with_apple',
    //   queryParameters: <String, String>{
    //     'code': authorizationCode,
    //     if (firstName != null) 'firstName': firstName,
    //     if (lastName != null) 'lastName': lastName,
    //     'useBundleId': !kIsWeb && (Platform.isIOS || Platform.isMacOS) ? 'true' : 'false',
    //     if (appleCredential.state != null) 'state': appleCredential.state!,
    //   },
    // );
    //
    // final session = await http.Client().post(signInWithAppleEndpoint);
    // print('Session response: ${session.body}');
  } catch (e) {
    print('Error using Apple SSO: $e');
    AutoRouter.of(context).replaceAll([MainRoute()]); // tmep
    rethrow;
  }
}
