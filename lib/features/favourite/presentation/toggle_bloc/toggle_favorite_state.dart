part of 'toggle_favorite_bloc.dart';

@immutable
abstract class ToggleFavoriteState {}

abstract class ToggleFavoriteActionState extends ToggleFavoriteState{}


class ToggleFavoriteInitial extends ToggleFavoriteState {}


class ToggleFavoriteLoadingState extends ToggleFavoriteState {}

class ToggleFavoriteErrorState extends ToggleFavoriteState {}

class ToggleFavoriteSuccessfulState extends ToggleFavoriteState {
  // final ProfilePageDataUiModel profilePage; //should be change for 1 profile map
  // ProfilePageFetchingSuccessfulState({
  //   required this.profilePage,
  // });
}
