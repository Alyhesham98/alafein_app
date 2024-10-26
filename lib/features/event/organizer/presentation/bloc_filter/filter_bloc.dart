import 'dart:async';

import 'package:alafein/features/event/organizer/presentation/model/filter_model.dart';
import 'package:alafein/features/event/organizer/repos/filter_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {

  FilterBloc()
     : super(FilterInitial()) {
    on<FilterInitialEvent>(filterInitialFetchEvent);

  }

  FutureOr<void> filterInitialFetchEvent(
    FilterInitialEvent event, Emitter<FilterState> emit) async{
      emit(FilterLoadingState());
      List<FilterModel> filters = await FilterRepo.fetchFilter(
        event.pageNumber,
        event.pageSize,
        event.name,
        // event.nameEn,
        // event.nameAr,
        event.dateFrom,
        event.dateTo,
        event.minFeeCost,
        event.maxFeeCost
      );
      emit(FilterSuccessfulState(filterList :filters));
  }
}