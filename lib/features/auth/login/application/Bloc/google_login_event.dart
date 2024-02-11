// GoogleLogin => App

import 'package:alafein/features/auth/login/model/google_login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class GoogleLoginEvent extends Equatable{

  const GoogleLoginEvent();

  @override
  List<Object > get props => [];

}

class GoogleLogoutRequest extends GoogleLoginEvent {}

class GoogleLoginChanged extends GoogleLoginEvent {

  @visibleForTesting
  const GoogleLoginChanged({required this.googleLoginModel});

  final GoogleLoginModel googleLoginModel;

  @override
  List<Object > get props => [googleLoginModel];

}