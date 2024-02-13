part of 'event_category_bloc.dart';

@immutable
abstract class EventCategoryState {}

abstract class EventCategoryActionState extends EventCategoryState{}


class EventCategoryInitial extends EventCategoryState {}


class EventCategoryLoadingState extends EventCategoryState {}

class EventCategoryErrorState extends EventCategoryState {}

class EventCategoryFetchingSuccessfulState extends EventCategoryState {
  final List<EventDataUiModel> eventCatigories;
  EventCategoryFetchingSuccessfulState({
    required this.eventCatigories,
  });
}
