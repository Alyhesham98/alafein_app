part of 'list_event_bloc.dart';

abstract class ListEventState {}

abstract class ListEventActionState extends ListEventState{}

class ListEventInitial extends ListEventState {}


class ListEventLoadingState extends ListEventState {}

class ListEventErrorState extends ListEventState {
  final List<ListEventModel> listEvent;
  ListEventErrorState({
    required this.listEvent,
  });
}

class ListEventFetchingSuccessfulState extends ListEventState {
  final List<ListEventModel> listEvent;
  ListEventFetchingSuccessfulState({
    required this.listEvent,
  });
}