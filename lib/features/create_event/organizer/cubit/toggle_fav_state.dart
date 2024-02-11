part of 'toggle_fav_cubit.dart';


sealed class ToggleFavState {}

final class ToggleFavInitial extends ToggleFavState {}

final class ToggleFavSuccessed extends ToggleFavState {}

final class ToggleFavError extends ToggleFavState {
  final String message;
  ToggleFavError({required this.message});
}

final class ToggleFavLoading extends ToggleFavState {}
