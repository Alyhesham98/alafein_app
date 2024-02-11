
import 'package:alafein/features/auth/login/model/google_login_model.dart';
import 'package:equatable/equatable.dart';

enum GoogleLoginStatus{
  authenticated,
  unauthenticated
}

class GoogleLoginState extends Equatable{
  const GoogleLoginState._({required this.googleLoginStatus, this.googleLoginModel});

  final GoogleLoginStatus googleLoginStatus;
  final GoogleLoginModel? googleLoginModel;

  const GoogleLoginState.authenticated(GoogleLoginModel googleLoginModel)
   : this._(googleLoginStatus: GoogleLoginStatus.authenticated , googleLoginModel: googleLoginModel);

  const GoogleLoginState.unauthenticated()
   : this._(googleLoginStatus: GoogleLoginStatus.unauthenticated);
   

  @override
  List<Object?> get props =>[googleLoginStatus , googleLoginModel];

} 