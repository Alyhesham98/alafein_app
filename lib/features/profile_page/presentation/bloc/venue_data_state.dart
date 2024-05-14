part of 'venue_data_bloc.dart';


@immutable
abstract class VenueDataState {}

abstract class VenueDataActionState extends VenueDataState{}


class VenueDataInitial extends VenueDataState {}


class VenueDataLoadingState extends VenueDataState {}

class VenueDataErrorState extends VenueDataState {}

class VenueDataFetchingSuccessfulState extends VenueDataState {
  final VenueData? venueData;
  VenueDataFetchingSuccessfulState({
    required this.venueData,
  });
}
