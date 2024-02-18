part of 'favorite_list_bloc.dart';

@immutable
abstract class FavoriteListState {}

abstract class FavoriteListActionState extends FavoriteListState{}


class FavoriteListInitial extends FavoriteListState {}


class FavoriteListLoadingState extends FavoriteListState {}

class FavoriteListErrorState extends FavoriteListState {}

class FavoriteListSuccessfulState extends FavoriteListState {
  // final ProfilePageDataUiModel profilePage; //should be change for 1 profile map
  // ProfilePageFetchingSuccessfulState({
  //   required this.profilePage,
  // });
  final List<FavoriteListModel> favoriteList;
  FavoriteListSuccessfulState ({
    required this.favoriteList,
  });
}
