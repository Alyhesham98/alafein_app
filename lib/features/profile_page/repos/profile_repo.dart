
import 'dart:convert';
import 'dart:developer';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/profile_page/presentation/model/Profile.dart';
import 'package:alafein/features/profile_page/presentation/model/profile_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;


// import 'package:alafein/features/profile_page/presentation/model/profile_page_ui_model.dart';

class ProfilePageRepo{

  // GET 
  //Fetch User Profile
  static Future<Profile?> fetchProfile() async{
    var client = http.Client();

      try {
        
        var response = await client.get(
          Uri.parse('https://alafein.azurewebsites.net/api/v1/User/Profile'),
          headers: {"Authorization": "Bearer ${SessionManagement.getUserToken()}"},
        );        
        Map<String, dynamic> result = jsonDecode(response.body);

        debugPrint("2 :${result['Data'].toString()}");

        ///////////////////////////////////////////////////////////////////////////////////////////
        Profile? profilePage = Profile.fromJson(result['Data']);// as Map<String, dynamic>
        debugPrint("2 :${result['Facilities'].toString()}");

        if (result.containsKey('Data') && result['Data'] != null) {
          profilePage = Profile.fromJson(result['Data']);
          print("3 :${profilePage.email}");
        } else {
          print("Data is null or not available");
        }
        return profilePage;
      } catch (e){
        log('error$e');
        EasyLoading.dismiss();
        return null;
      }
  }

  // PATCH
  //Edit User Profile
  static Future<bool> editProfile(String firstName,String lastName,String photo,String phone,) async{
    var client = http.Client();

    final msg = jsonEncode({
            "firstName": firstName,
            "lastName": lastName,
            "photo": photo,
            "phone": phone
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
