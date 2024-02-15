import 'dart:async';

import 'package:alafein/features/profile_page/presentation/model/profile_page_ui_model.dart';
import 'package:alafein/features/profile_page/repos/profile_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';


part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc() : super(ProfilePageInitial()) {
    //Get profile
    on<ProfilePageInitialFetchEvent>(profilePageInitialFetchEvent);

    //Edit profile
    on<ProfilePageEditEvent>(profilePageEdit);

  }

  FutureOr<void> profilePageInitialFetchEvent(
    ProfilePageInitialFetchEvent event, Emitter<ProfilePageState> emit) async{
      emit(ProfilePageLoadingState());
      print("=====================================================================.");
      print("u are in ProfilePageInitialFetchEvent");
      print("It is a method in profile page bloc class");
      print("Used to fetch profile data from server and save it into local storage.");
      print("=====================================================================.");
      
      ProfilePageDataUiModel? profilePage = await ProfilePageRepo.fetchProfile();
        emit(ProfilePageFetchingSuccessfulState(profilePage :profilePage!));

      }

  
  FutureOr<void> profilePageEdit(ProfilePageEditEvent event, Emitter<ProfilePageState> emit) async {
    bool success = await ProfilePageRepo.editProfile();
    print("Profile paged Edited !! : ${success}");

    if(success){
      emit(ProfilePageEdittingSuccessfulState());
    }else{
      emit(ProfilePageEdittingErrorState());
    }
  }
  }

// }
// List eventsData = result['Data'];
        // print("//${eventsData}\\");


        // for (int i = 0 ; i < eventsData.length ; i++ ){
        //   EventDataUiModel event = EventDataUiModel.fromJson(eventsData[i]);// as Map<String, dynamic>
        //   events.add(event);
        // }
        //   print(" events : ${events}");

        // // Map<String, dynamic> result = jsonDecode(response.body);
        // // print("////${result['Data']}\\\\");

        // //   Map<String, dynamic> eventsData = result['Data'];
          
        // //   for (int i = 0; i < eventsData.length; i++) {
        // //     EventDataUiModel event = EventDataUiModel.fromJson(eventsData[i]);
        // //     events.add(event);
        // //   }


/*
      // var client = http.Client();

      // try {
        
      //   var response = await client.get(
      //     Uri.parse('https://alafein.azurewebsites.net/api/v1/User/Profile'),
      //     headers: {"Authorization": "Bearer ${SessionManagement.getUserToken()}"},
      //   );        
      //   // List result = jsonDecode(response.body);
      //   Map<String, dynamic> result = jsonDecode(response.body);
      //   // print("////${result['Data']}\\\\");
      //   print("result : ${result}");


      //   ProfilePageDataUiModel profilePage = ProfilePageDataUiModel.fromJson(result['Data']);// as Map<String, dynamic>
      //   // ProfilePageDataUiModel profilePage = result ;

 */        