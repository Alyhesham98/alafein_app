
import 'dart:convert';
import 'dart:developer';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/event/organizer/presentation/model/list_event_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:http/http.dart' as http;

class ListEventRepo{

  static Future <List<ListEventModel>> fetchEvent() async{
    var client = http.Client();

      List<ListEventModel> events= [];
        try {
        //?PageNumber=1&PageSize=500
        var response = await client.get(
          Uri.parse('https://alafein.azurewebsites.net/api/v1/Event/GetPagination?PageNumber=${SessionManagement.pageNumber}&PageSize=${SessionManagement.pageSize}'),
          headers: {"Authorization": "Bearer ${SessionManagement.getUserToken()}"},
        );
        
        
        EasyLoading.show(status: 'loading');
        if (response.statusCode == 200) {
          Future.delayed(const Duration(seconds: 1), () {
          EasyLoading.dismiss();
          });

        Map<String, dynamic> result = jsonDecode(response.body);

        List eventsData = result['Data'];
        print("//${eventsData}\\");


        for (int i = 0 ; i < eventsData.length ; i++ ){
          ListEventModel event = ListEventModel.fromJson(eventsData[i]);// as Map<String, dynamic>
          events.add(event);
        }
        return events;

        } else{
               EasyLoading.showError("Error");
        }

      
      return events ;
    }
    catch (e){
      log(e.toString());
      return [];
    }
  }
}