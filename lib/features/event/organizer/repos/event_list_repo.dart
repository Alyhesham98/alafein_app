
import 'dart:convert';
import 'dart:developer';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/event/organizer/presentation/model/list_event_model.dart';

import 'package:http/http.dart' as http;

class ListEventRepo{

  static Future <List<ListEventModel>> fetchEvent() async{
    var client = http.Client();

      List<ListEventModel> events= [];
      // var url = Uri.parse('https://alafein.azurewebsites.net/api/v1/Event/GetCategories?isAscending=false');
      // var  header= {"Authorization": "Bearer ${SessionManagement.getUserToken()}"};
        try {
        //?PageNumber=1&PageSize=500
        var response = await client.get(
          Uri.parse('https://alafein.azurewebsites.net/api/v1/Event/GetPagination?PageNumber=${SessionManagement.pageNumber}&PageSize=${SessionManagement.pageSize}'),
          headers: {"Authorization": "Bearer ${SessionManagement.getUserToken()}"},
        );        
        // List result = jsonDecode(response.body);
        Map<String, dynamic> result = jsonDecode(response.body);
        print("////${result['Data']}\\\\");

        List eventsData = result['Data'];
        print("//${eventsData}\\");


        for (int i = 0 ; i < eventsData.length ; i++ ){
          ListEventModel event = ListEventModel.fromJson(eventsData[i]);// as Map<String, dynamic>
          events.add(event);
        }
          print(" events : ${events}");
      
      return events ;
    }
    catch (e){
      log(e.toString());
      return [];
    }
  }
}