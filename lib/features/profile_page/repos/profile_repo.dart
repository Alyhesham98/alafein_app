
import 'dart:convert';
import 'dart:developer';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


import 'package:alafein/features/profile_page/presentation/model/profile_page_ui_model.dart';

class ProfilePageRepo{

  // GET 
  //Fetch User Profile
  static Future<ProfilePageDataUiModel?> fetchProfile() async{
    var client = http.Client();

      try {
        
        var response = await client.get(
          Uri.parse('https://alafein.azurewebsites.net/api/v1/User/Profile'),
          headers: {"Authorization": "Bearer ${SessionManagement.getUserToken()}"},
        );        
        Map<String, dynamic> result = jsonDecode(response.body);

        debugPrint(result.toString());

        ProfilePageDataUiModel profilePage = ProfilePageDataUiModel.fromJson(result['Data']);// as Map<String, dynamic>
        
        print("Request Done");
        return profilePage;
      } catch (e){
        log(e.toString());
        return null;
      }
  }

  // PATCH
  //Edit User Profile
  static Future<bool> editProfile() async{
    var client = http.Client();

    final msg = jsonEncode({
            "firstName": "first",
            "lastName": "last",
            "photo": "string",
            "phone": "01022971429"
          });
      try {
        
        var response = await client.patch(
          Uri.parse('https://alafein.azurewebsites.net/api/v1/User/Update'),
          headers: {
            "Authorization": "Bearer ${SessionManagement.getUserToken()}",
            'Content-Type': 'application/json-patch+json; charset=UTF-8',
            },
          body: msg
        );       

        if (response.statusCode >= 200 && response.statusCode < 300) {
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
