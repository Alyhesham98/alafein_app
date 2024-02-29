part of 'upload_profile_picture_cubit.dart';

@immutable
abstract class UploadProfilePictureState {}

class UploadProfilePictureInitial extends UploadProfilePictureState {}
class UploadProfilePictureLoaded extends UploadProfilePictureState {}
class UploadProfilePictureLoading extends UploadProfilePictureState {}
class UploadProfilePictureError extends UploadProfilePictureState {
  final String message;
  UploadProfilePictureError({required this.message});
}

