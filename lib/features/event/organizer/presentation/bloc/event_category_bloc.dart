import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/event/organizer/presentation/model/event_data_ui_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

part 'event_category_event.dart';
part 'event_category_state.dart';


class EventCategoryBloc extends Bloc<EventCategoryEvent, EventCategoryState> {
  EventCategoryBloc() : super(EventCategoryInitial()) {
    on<EventCategoryInitialFetchEvent>(eventCategoryInitialFetchEvent);
  }

  FutureOr<void> eventCategoryInitialFetchEvent(
    EventCategoryInitialFetchEvent event, Emitter<EventCategoryState> emit) async {
      print("u are in eventCategoryInitialFetchEvent");
      var client = http.Client();

      List<EventDataUiModel> events= [];
      // var url = Uri.parse('https://alafein.azurewebsites.net/api/v1/Event/GetCategories?isAscending=false');
      // var  header= {"Authorization": "Bearer ${SessionManagement.getUserToken()}"};
        try {
        
        var response = await client.get(
          Uri.parse('https://alafein.azurewebsites.net/api/v1/Event/GetCategories?isAscending=false'),
          headers: {"Authorization": "Bearer ${SessionManagement.getUserToken()}"},
        );        
        // List result = jsonDecode(response.body);
        Map<String, dynamic> result = jsonDecode(response.body);
        print("////${result['Data']}\\\\");

        List eventsData = result['Data'];
        print("//${eventsData}\\");


        for (int i = 0 ; i < eventsData.length ; i++ ){
          EventDataUiModel event = EventDataUiModel.fromJson(eventsData[i]);// as Map<String, dynamic>
          events.add(event);
        }
          print(" events : ${events}");

        // Map<String, dynamic> result = jsonDecode(response.body);
        // print("////${result['Data']}\\\\");

        //   Map<String, dynamic> eventsData = result['Data'];
          
        //   for (int i = 0; i < eventsData.length; i++) {
        //     EventDataUiModel event = EventDataUiModel.fromJson(eventsData[i]);
        //     events.add(event);
        //   }
          emit(EventCategoryFetchingSuccessfulState(eventCatigories :events));

        } catch(e) {
        log(e.toString());
        print("-----------------------------------------------------------------error");
      }
  }

}
// {

//   if (state.homeResponse.category != null)
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin:
//               const EdgeInsets.symmetric(vertical: 16),
//           child: Text(
//             'categories'.toUpperCase(),
//             style: homeLabelStyle,
//           ),
//         ),
//         GridView.builder(
//           gridDelegate:
//               SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 4,
//             childAspectRatio: 0.75,
//             crossAxisSpacing: 3.sw,
//             mainAxisSpacing: 3.sw,
//           ),
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount:
//               state.homeResponse.category?.length ?? 0,
//           itemBuilder: (context, index) => SizedBox(
//             child: Column(
//               children: [
//                 SvgPicture.network(
//                   "${APICallerConfiguration.baseImageUrl}${state.homeResponse.category?[index].image}",
//                   placeholderBuilder: (context) =>
//                       Image.asset(AssetsData.music),
//                 ),
//                 const Gap(4),
//                 Text(
//                     state.homeResponse.category?[index]
//                             .name ??
//                         "Event",
//                     textAlign: TextAlign.center,
//                     style: homeLabel3Style)
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   Padding(
//     padding: const EdgeInsets.symmetric(
//       horizontal: 8,
//     ),
//     child: Center(
//       child: SmoothPageIndicator(
//         controller: _scrollController,
//         count:
//             (state.homeResponse.category?.length ?? 0) > 8
//                 ? 2
//                 : 1,
//         effect: const ScrollingDotsEffect(
//           dotWidth: 8,
//           dotHeight: 8,
//           spacing: 5.0,
//           dotColor: Colors.grey,
//           activeDotColor: Color(0xFFFF73C6),
//         ),
//       ),
//     ),
//   ),
// }