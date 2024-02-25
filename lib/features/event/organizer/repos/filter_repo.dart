
import 'dart:convert';
import 'dart:developer';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/event/organizer/presentation/model/filter_model.dart';
// import 'package:alafein/features/favourite/presentation/model/favorite_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;


class FilterRepo{

  // POST 
  //Fetch Fillter  Data From Server
  static Future<List<FilterModel>> fetchFilter(
    int pageNumber, 
    int pageSize , 
    String categoryName,
    String dateFrom,
    String dateTo,
    double minFeeCost,
    double maxFeeCost,
    ) async{
    var client = http.Client();
    List<FilterModel> filters= [];
    final msg = jsonEncode(
      {
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "name": categoryName,
        "from": dateFrom,
        "to": dateTo,
        "minFee": minFeeCost,
        "maxFee": maxFeeCost
      }
    );
    try { 
      print("pageNumber:${pageNumber}\n pageSize :${pageSize}\n name: ${categoryName}\n from:${dateFrom}\n to: ${dateTo}\n Min cost :${minFeeCost}\n max cost:${maxFeeCost}\n");
      var response = await client.post(
        Uri.parse('https://alafein.azurewebsites.net/api/v1/Event/GetFilterPagination'),
        headers: {
          "Authorization": "Bearer ${SessionManagement.getUserToken()}",
          'Content-Type': 'application/json-patch+json; charset=UTF-8',
          },
        body: msg
      );       

      EasyLoading.show(status: 'loading');
        if (response.statusCode == 200) {
          EasyLoading.dismiss();

        Map<String, dynamic> result = jsonDecode(response.body);
        debugPrint(result.toString());
        List filterData = result['Data'];
        debugPrint("//${filterData}\\");


        for (int i = 0 ; i < filterData.length ; i++ ){
          FilterModel filter = FilterModel.fromJson(filterData[i]);// as Map<String, dynamic>
          filters.add(filter);
        }
        return filters;

        } else{
          print("Errrrrrrrrrrror !${response.body}");
          EasyLoading.showError("Error");
        }
      EasyLoading.dismiss();
      return filters ;
      } catch (e) {
        log(e.toString());
        return [];
    }     
  }
}