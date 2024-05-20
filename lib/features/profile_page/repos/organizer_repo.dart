import 'dart:convert';
import 'dart:developer';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'package:alafein/features/profile_page/presentation/model/Profile.dart';
import '../presentation/model/venue.dart';

class OrganizerPageRepo {
  // GET
  //Fetch Venue
  static Future<Map<String, dynamic>?> fetchOrganizer(int? id) async {
    var client = http.Client();
    print('REPO TESTING organizer DATA WITH VENUE ID $id');
    try {
      var response = await client.get(
        Uri.parse(
            'https://alafein.azurewebsites.net/api/v1/Organizer/Detail/$id'),
        headers: {
          "Authorization": "Bearer ${SessionManagement.getUserToken()}"
        },
      );
      Map<String, dynamic> result = jsonDecode(response.body);
      print('result of fetching data for Organizer: $result');
      print('Response code: ${response.statusCode}');

      if (result.containsKey('Data') && result['Data'] != null) {
        final organizerJson = result['Data'];
        final organizerData = Organizer.fromJson(organizerJson);
        print('result of fetching data for Organizer: ${organizerJson['User']}');
        final userData = organizerJson['User'];
        final userDataParsed = ProfileOrg.fromJson(userData);

        EasyLoading.dismiss();
        return {
          'organizerData': organizerData,
          'userData': userDataParsed,
        };
      } else {
        print("Data is null or not available");
      }
      EasyLoading.dismiss();
      return null;
    } catch (e) {
      log('error$e');
      EasyLoading.dismiss();
      return null;
    }
  }
}
