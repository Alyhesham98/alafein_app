

import 'dart:async';

import 'package:alafein/features/favourite/repos/toggle_favorite_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



part 'toggle_favorite_event.dart';
part 'toggle_favorite_state.dart';

class ToggleFavoriteBloc extends Bloc<ToggleFavoriteEvent, ToggleFavoriteState> {
  final int? toggleSubmissionId;
  ToggleFavoriteBloc(this.toggleSubmissionId) : super(ToggleFavoriteInitial()) {
    on<ToggleFavoriteInitialFetchEvent>(toggleFavoriteInitialFetchEvent);

  }

  FutureOr<void> toggleFavoriteInitialFetchEvent(
    ToggleFavoriteInitialFetchEvent event, Emitter<ToggleFavoriteState> emit) async{
      emit(ToggleFavoriteLoadingState());
      bool success = await ToggleRepo.fetchToggleFavorite(toggleSubmissionId!);
      if (success){
        emit(ToggleFavoriteSuccessfulState());
      }else{
        emit(ToggleFavoriteErrorState());
      }    
  }
}