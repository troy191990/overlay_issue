import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:example/model/homeOption/home_option_full_response.dart';
import 'package:example/repository/baseRepository.dart';
import 'package:flutter/services.dart';

class HomeOptionsApiProvider {
  Future<dynamic> _loadHomeOptionsFromAssetFile() async {
    return await rootBundle.loadString('assets/homeOptions.json');
  }

  Future<HomeOptionFull> getHomeOptions() async {
    try {
      var response = await _loadHomeOptionsFromAssetFile();
      final jsonResponse = json.decode(response);
      return HomeOptionFull.fromJson(jsonResponse);
    } on DioError catch (e) {
      print("Exception occured - getHomeOptions: $e");
      if (e.response != null && e.response.statusCode == 400) {
        return HomeOptionFull.withApiCreatedError(e.response.data);
      } else if (e.response != null && e.response.statusCode == 500) {
        return HomeOptionFull.withApiCreatedError(e.response.data);
      } else {
        var errorText = BaseApiProvider.handleError(e);
        return HomeOptionFull.withError(errorText);
      }
    } catch (error) {
      return HomeOptionFull.withError("Unknown error occured");
    }
  }
}
