import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/local_data/session_management.dart';
import '../../repos/organizer_repo.dart';
import 'package:alafein/features/profile_page/presentation/model/Profile.dart';

part 'organizer_data_event.dart';
part 'organizer_data_state.dart';


class OrganizerDataBloc extends Bloc<OrganizerDataEvent, OrganizerDataState> {
  final int? id;

  OrganizerDataBloc(
      this.id,

      ) : super(OrganizerDataInitial()) {
    //Get venue
    on<OrganizerDataInitialFetchEvent>(_organizerDataInitialFetchEvent);
  }

  Future<void> _organizerDataInitialFetchEvent(OrganizerDataInitialFetchEvent event, Emitter<OrganizerDataState> emit) async {
    emit(OrganizerDataLoadingState());
    print(
        "=====================================================================.");
    print("u are in OrganizerDataInitialFetchEvent");
    print("It is a method in Organizer data page bloc class");
    print(
        "Used to fetch Organizer data from server and save it into local storage.");
    print(
        "=====================================================================.");

    // Fetch both organizer and user data from the repository
    Map<String, dynamic>? organizerData = await OrganizerPageRepo.fetchOrganizer(id); // Pass id here

// Extract organizer and user data from the map
    Organizer? organizer = organizerData?['organizerData'];
    ProfileOrg? userData = organizerData?['userData'];

    // Organizer? organizerData = await OrganizerPageRepo.fetchOrganizer(id); // Pass id here
    emit(OrganizerDataFetchingSuccessfulState(organizerData: organizer, userData: userData));
  }
}
