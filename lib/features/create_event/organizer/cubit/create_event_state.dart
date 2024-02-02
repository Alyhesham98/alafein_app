part of 'create_event_cubit.dart';

sealed class CreateEventState {}

final class CreateEventInitial extends CreateEventState {}

final class CreateEventSuccessed extends CreateEventState {}

final class CreateEventError extends CreateEventState {
  final String message;
  CreateEventError({required this.message});
}

final class CreateEventLoading extends CreateEventState {}
