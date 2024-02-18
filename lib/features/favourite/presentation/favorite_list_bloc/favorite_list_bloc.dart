

import 'dart:async';

import 'package:alafein/features/favourite/presentation/model/favorite_list_model.dart';
import 'package:alafein/features/favourite/repos/favorite_list_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_list_event.dart';
part 'favorite_list_state.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  final int pageNumber;
  final int pageSize;
  final bool isFavourite;
  FavoriteListBloc(this.pageNumber, this.pageSize, this.isFavourite) : super(FavoriteListInitial()) {
    on<FavoriteListInitialFetchEvent>(favoriteListInitialFetchEvent);

  }

  FutureOr<void> favoriteListInitialFetchEvent(
    FavoriteListInitialFetchEvent event, Emitter<FavoriteListState> emit) async{
      emit(FavoriteListLoadingState());
      List<FavoriteListModel> favorites = await FavoriteListRepo.fetchFavoriteList(
        pageNumber,
        pageSize,
        isFavourite
      );
      emit(FavoriteListSuccessfulState(favoriteList :favorites));
  }
}