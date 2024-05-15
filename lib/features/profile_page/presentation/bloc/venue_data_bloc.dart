import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/local_data/session_management.dart';
import '../../repos/venue_repo.dart';
import '../model/venue.dart';

part 'venue_data_event.dart';
part 'venue_data_state.dart';


class VenueDataBloc extends Bloc<VenueDataEvent, VenueDataState> {
  final int? id;

  VenueDataBloc(
      this.id,

      ) : super(VenueDataInitial()) {
    //Get venue
    on<VenueDataInitialFetchEvent>(_venueDataInitialFetchEvent);
  }

  Future<void> _venueDataInitialFetchEvent(VenueDataInitialFetchEvent event, Emitter<VenueDataState> emit) async {
    emit(VenueDataLoadingState());
    print(
        "=====================================================================.");
    print("u are in VenueDataInitialFetchEvent");
    print("It is a method in venue data page bloc class");
    print(
        "Used to fetch venue data from server and save it into local storage.");
    print(
        "=====================================================================.");

    VenueData? venueData = await VenuePageRepo.fetchVenue(id); // Pass id here
    emit(VenueDataFetchingSuccessfulState(venueData: venueData));
  }
}
