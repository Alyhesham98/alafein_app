part of 'profile_page_bloc.dart';

@immutable
abstract class ProfilePageState {}

abstract class ProfilePageActionState extends ProfilePageState{}


class ProfilePageInitial extends ProfilePageState {}


class ProfilePageLoadingState extends ProfilePageState {}

class ProfilePageErrorState extends ProfilePageState {}

class ProfilePageFetchingSuccessfulState extends ProfilePageState {
  final ProfilePageDataUiModel profilePage; //should be change for 1 profile map
  ProfilePageFetchingSuccessfulState({
    required this.profilePage,
  });
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
// Edit section

class  ProfilePageEdittingSuccessfulState extends ProfilePageActionState {}

class  ProfilePageEdittingErrorState extends ProfilePageActionState {}
