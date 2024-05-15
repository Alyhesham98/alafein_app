part of 'organizer_data_bloc.dart';


@immutable
abstract class OrganizerDataState {}

abstract class OrganizerDataActionState extends OrganizerDataState{}


class OrganizerDataInitial extends OrganizerDataState {}


class OrganizerDataLoadingState extends OrganizerDataState {}

class OrganizerDataErrorState extends OrganizerDataState {}

class OrganizerDataFetchingSuccessfulState extends OrganizerDataState {
  final Organizer? organizerData;
  OrganizerDataFetchingSuccessfulState({
    required this.organizerData,
  });
}
