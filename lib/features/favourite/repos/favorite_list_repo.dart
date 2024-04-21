
import 'dart:convert';
import 'dart:developer';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/favourite/presentation/model/favorite_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;


class FavoriteListRepo{

  // POST 
  //Fetch favorite list
  static Future<List<FavoriteListModel>> fetchFavoriteList(int pageNumber, int pageSize , bool isFavourite) async{
    var client = http.Client();
    List<FavoriteListModel> favorites= [];
    final msg = jsonEncode(
      {
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "isFavourite": isFavourite,
      }
    );
    try { 
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

        List favourateData = result['Data'];
        debugPrint("//$favourateData\\");


        for (int i = 0 ; i < favourateData.length ; i++ ){
          FavoriteListModel favorite = FavoriteListModel.fromJson(favourateData[i]);// as Map<String, dynamic>
          favorites.add(favorite);
        }
        // print("Errrrrrrrrrrror !${favorites}");
        return favorites;

        } else{
          print("Errrrrrrrrrrror !${response.body}");
          EasyLoading.showError("Error");
        }
      EasyLoading.dismiss();
      return favorites ;
      } catch (e) {
        log(e.toString());
        return [];
    }     
  }
}