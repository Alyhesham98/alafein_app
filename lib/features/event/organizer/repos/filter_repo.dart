import 'dart:convert';
import 'dart:developer';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/event/organizer/presentation/model/filter_model.dart';
// import 'package:alafein/features/favourite/presentation/model/favorite_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class FilterRepo {
  // POST
  //Fetch Fillter  Data From Server
  static Future<List<FilterModel>> fetchFilter({
    required int pageNumber,
    required int pageSize,
    String? name,
    bool? isFavourite,
    String? dateFrom,
    String? dateTo,
    int? categoryId,
    double? minFeeCost,
    double? maxFeeCost,
  }) async {
    var client = http.Client();
    List<FilterModel> filters = [];
    final msg = jsonEncode({
      "pageNumber": pageNumber,
      "pageSize": pageSize,
      "name": name,
      "isFavourite": isFavourite,
      "from": dateFrom,
      "to": dateTo,
      "categoryId": categoryId,
      "minFee": minFeeCost,
      "maxFee": maxFeeCost,
    });
    try {
      print("Request payload: $msg");
      var response = await client.post(
        Uri.parse(
            'https://alafein.azurewebsites.net/api/v1/Event/GetFilterPagination'),
        headers: {
          "Authorization": "Bearer ${SessionManagement.getUserToken()}",
          'Content-Type': 'application/json-patch+json; charset=UTF-8',
        },
        body: msg,
      );

      EasyLoading.show(status: 'Loading...');
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        Map<String, dynamic> result = jsonDecode(response.body);
        debugPrint("API Response: ${result.toString()}");

        List filterData = result['Data'] ?? [];
        for (var item in filterData) {
          filters.add(FilterModel.fromJson(item));
        }
        return filters;
      } else {
        print("Error: ${response.body}");
        EasyLoading.showError("Failed to fetch data");
        return [];
      }
    } catch (e) {
      log("Error: ${e.toString()}");
      EasyLoading.showError("An unexpected error occurred");
      return [];
    } finally {
      client.close();
    }
  }
}
