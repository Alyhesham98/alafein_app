
import 'dart:convert';
import 'dart:developer';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/favourite/presentation/model/toggle_favorite_ui_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class ToggleRepo{

  // POST 
  //Fetch toggle favorite
  static Future<bool> fetchToggleFavorite() async{
    var client = http.Client();
    final msg = jsonEncode(
      {
        "submissionId": 2   // event id
      }
    );
    try { 
      var response = await client.post(
        Uri.parse('https://alafein.azurewebsites.net/api/v1/Event/ToggleFavourite'),
        headers: {
          "Authorization": "Bearer ${SessionManagement.getUserToken()}",
          'Content-Type': 'application/json-patch+json; charset=UTF-8',
          },
        body: msg
      );       

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("${response.body}");
        print("true");
        return true;
      } else{
        return false;
      }

      } catch (e) {
        log(e.toString());
        return false;
    }     
  }
}