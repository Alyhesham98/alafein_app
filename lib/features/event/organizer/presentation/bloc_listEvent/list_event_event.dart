part of 'list_event_bloc.dart';

abstract class ListEventEvent {}

class ListEventInitialFetchEvent extends ListEventEvent {
  final bool isCategory;
  final int categoryId;

  ListEventInitialFetchEvent({required this.isCategory, required this.categoryId});
}

