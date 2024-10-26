import 'dart:convert';
import 'dart:developer';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/favourite/presentation/model/favorite_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class FavoriteListRepo {
  // Fetch favorite list
  static Future<List<FavoriteListModel>> fetchFavoriteList(
      int pageNumber, int pageSize, bool isFavourite) async {
    var client = http.Client();
    List<FavoriteListModel> favorites = [];
    final msg = jsonEncode({
      "pageNumber": pageNumber,
      "pageSize": pageSize,
      "isFavourite": isFavourite,
    });

    try {
      // Fetch token and handle potential null value
      String? token = SessionManagement.getUserToken();
      if (token == null) {
        EasyLoading.showError("Authorization token is missing.");
        log("Authorization token is missing.");
        return favorites;
      }

      var response = await client.post(
        Uri.parse(
            'https://alafein.azurewebsites.net/api/v1/Event/GetFilterPagination'),
        headers: {
          "Authorization": "Bearer $token",
          'Content-Type': 'application/json-patch+json; charset=UTF-8',
        },
        body: msg,
      );

      EasyLoading.show(status: 'Loading...');
      if (response.statusCode == 200) {
        EasyLoading.dismiss();

        Map<String, dynamic> result = jsonDecode(response.body);

        List favouriteData = result['Data'];
        debugPrint("//$favouriteData\\");

        for (int i = 0; i < favouriteData.length; i++) {
          FavoriteListModel favorite =
              FavoriteListModel.fromJson(favouriteData[i]);
          favorites.add(favorite);
        }
        return favorites;
      } else {
        log("Error fetching favorites: ${response.body}");
        EasyLoading.showError("Error fetching favorites.");
      }
      EasyLoading.dismiss();
      return favorites;
    } catch (e) {
      EasyLoading.dismiss();
      log("Exception occurred: $e");
      EasyLoading.showError("Failed to fetch data.");
      return [];
    } finally {
      client.close();
    }
  }
}
