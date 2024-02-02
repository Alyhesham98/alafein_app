part of 'signup_cubit.dart';

class SignupState {}

class SignupStateInitial extends SignupState {}

class SignupStateLoading extends SignupState {}

class SignupStateLoaded extends SignupState {}

class SignupStateError extends SignupState {
  String message;
  SignupStateError({required this.message});
}
