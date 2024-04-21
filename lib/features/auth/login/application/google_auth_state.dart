
abstract class GoogleAuthState {}

class GoogleAuthInitialState extends GoogleAuthState{}

class GoogleAuthLoadingState extends GoogleAuthState{}

class GoogleAuthSuccessState extends GoogleAuthState{
  // final GoogleLoginState user;

  GoogleAuthSuccessState();
}

class GoogleAuthFaildState extends GoogleAuthState{
  final String error;

  GoogleAuthFaildState(this.error);
}
