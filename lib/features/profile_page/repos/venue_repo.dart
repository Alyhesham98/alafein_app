
import 'dart:convert';
import 'dart:developer';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../presentation/model/venue.dart';


class VenuePageRepo{
  // GET
  //Fetch Venue
  static Future<VenueData?> fetchVenue(int id) async{
    var client = http.Client();
    print('REPO TESTING VENUE DATA WITH VENUE ID $id');
    try {

      var response = await client.get(
        Uri.parse('https://alafein.azurewebsites.net/api/v1/Venue/Detail/$id'),
        headers: {"Authorization": "Bearer ${SessionManagement.getUserToken()}"},
      );
      Map<String, dynamic> result = jsonDecode(response.body);
      print('result of fetching data: $result');
      print('Response code: ${response.statusCode}');

      VenueData? venueData = VenueData.fromJson(result['Data']);// as Map<String, dynamic>
      debugPrint("2 :${result['Facilities'].toString()}");

      if (result.containsKey('Data') && result['Data'] != null) {
        venueData = VenueData.fromJson(result['Data']);
        print("3 :${venueData.instagram}");
      } else {
        print("Data is null or not available");
      }
      EasyLoading.dismiss();
      return venueData;
    } catch (e){
      log('error$e');
      EasyLoading.dismiss();
      return null;
    }
  }
}
