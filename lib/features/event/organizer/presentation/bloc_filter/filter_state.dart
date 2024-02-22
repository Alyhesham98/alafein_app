part of 'filter_bloc.dart';

@immutable
abstract class FilterState {}

abstract class FilterActionState extends FilterState{}


class FilterInitial extends FilterState {}


class FilterLoadingState extends FilterState {}

class FilterErrorState extends FilterState {}

class FilterSuccessfulState extends FilterState {
  // final ProfilePageDataUiModel profilePage; //should be change for 1 profile map
  // ProfilePageFetchingSuccessfulState({
  //   required this.profilePage,
  // });
  final List<FilterModel> filterList;
  FilterSuccessfulState ({
    required this.filterList,
  });
}
