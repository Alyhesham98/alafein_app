
import 'package:alafein/features/auth/login/application/Bloc/google_login_state.dart';

abstract class GoogleAuthState {}

class GoogleAuthInitialState extends GoogleAuthState{}

class GoogleAuthLoadingState extends GoogleAuthState{}

class GoogleAuthSuccessState extends GoogleAuthState{
  final GoogleLoginState user;

  GoogleAuthSuccessState(this.user);
  
}

class GoogleAuthFaildState extends GoogleAuthState{
  final String error;

  GoogleAuthFaildState(this.error);
}
