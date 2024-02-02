abstract class GetEventState {}

class GetEventStateInital extends GetEventState {}

class LodingGetEventState extends GetEventState {}

class ScafullGetEventState extends GetEventState {}

class ErrorGetEventState extends GetEventState {
  final String error;
  ErrorGetEventState(this.error);
}

class ScafullGetEventDEatilsState extends GetEventState {}

class ErrorGetEventDEatilsState extends GetEventState {
  final String error;
  ErrorGetEventDEatilsState(this.error);
}
