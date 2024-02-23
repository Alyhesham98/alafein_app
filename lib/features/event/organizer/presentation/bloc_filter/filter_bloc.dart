import 'dart:async';

import 'package:alafein/features/event/organizer/presentation/model/filter_model.dart';
import 'package:alafein/features/event/organizer/repos/filter_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  // final int pageNumber;
  // final int pageSize;
  // // final bool isFavourite;
  
  // final String categoryName;
  // final  String dateFrom;
  // final  String dateTo;
  // final  double minFeeCost;
  // final  double maxFeeCost;

  FilterBloc(
    // this.pageNumber, this.pageSize, this.categoryName, this.dateFrom, this.dateTo, this.minFeeCost, this.maxFeeCost,
    )
     : super(FilterInitial()) {
    on<FilterInitialEvent>(filterInitialFetchEvent);

  }

  FutureOr<void> filterInitialFetchEvent(
    FilterInitialEvent event, Emitter<FilterState> emit) async{
      emit(FilterLoadingState());
      List<FilterModel> filters = await FilterRepo.fetchFilter(
        event.pageNumber,
        event.pageSize,
        event.categoryName,
        event.dateFrom,
        event.dateTo,
        event.minFeeCost,
        event.maxFeeCost
        // pageNumber,
        // pageSize,
        // categoryName,
        // dateFrom,
        // dateTo,
        // minFeeCost,
        // maxFeeCost
      );
      emit(FilterSuccessfulState(filterList :filters));
  }
}