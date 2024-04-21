import 'dart:convert';
import 'dart:developer';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/event/organizer/presentation/model/event_data_ui_model.dart';

import 'package:http/http.dart' as http;

class EventCategoryRepo{
  static Future <List<EventDataUiModel>> fetchEvent() async{

      var client = http.Client();
      List<EventDataUiModel> events= [];
      try {
        
        var response = await client.get(
          Uri.parse('https://alafein.azurewebsites.net/api/v1/Event/GetCategories?isAscending=false'),
          headers: {"Authorization": "Bearer ${SessionManagement.getUserToken()}"},
        );        
        // List result = jsonDecode(response.body);
        Map<String, dynamic> result = jsonDecode(response.body);
        print("////${result['Data']}\\\\");

        List eventsData = result['Data'];
        print("//$eventsData\\");


        for (int i = 0 ; i < eventsData.length ; i++ ){
          EventDataUiModel event = EventDataUiModel.fromJson(eventsData[i]);// as Map<String, dynamic>

          if(i==0)
            {

              event = EventDataUiModel.fromJson( {
                "Id": 0,
                "Name": "All",
                "Image": "Resources//CategoryResources//Images/Category/8671410f-40c4-405e-b852-1ba620e4ffb1.png",
                "IsPublished": true,
                "SortNo": 0
              },);//
              events.add(event);

            }
          event = EventDataUiModel.fromJson(eventsData[i]);// as Map<String, dynamic>
          events.add(event);
        }
          print(" events : $events");
        return events;
      }
      catch (e){
        log(e.toString());
        return [];
      }

  }
}