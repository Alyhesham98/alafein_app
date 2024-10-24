import 'dart:async';

import 'package:alafein/features/event/organizer/presentation/model/list_event_model.dart';
import 'package:alafein/features/event/organizer/repos/event_list_repo.dart';
import 'package:bloc/bloc.dart';

part 'list_event_event.dart';
part 'list_event_state.dart';

class ListEventBloc extends Bloc<ListEventEvent, ListEventState> {
  ListEventBloc() : super(ListEventInitial()) {
    on<ListEventInitialFetchEvent>(_listEventInitialFetchEvent);
  }

  Future<void> _listEventInitialFetchEvent(
    ListEventInitialFetchEvent event,
    Emitter<ListEventState> emit,
  ) async {
    emit(ListEventLoadingState());

    // Assuming ListEventRepo.fetchEvent requires isCategory and categoryId
    List<ListEventModel> events =
        await ListEventRepo.fetchEvent(event.isCategory, event.categoryId);
    if (events.isEmpty) {
      print('EMPTY EVENT HANDLE');
      final errorEvent = ListEventModel(
          id: null,
          poster: null,
          nameEn: null,
          nameAr: null,
          venue: null,
          date: null,
          isFavourite: null,
      );
      emit(ListEventErrorState(listEvent: [errorEvent]));
    } else {
      print('NOT EMPTY EVENT HANDLE');
      emit(ListEventFetchingSuccessfulState(listEvent: events));
    }

    emit(ListEventFetchingSuccessfulState(listEvent: events));
  }
}
