// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:hog/data/endpoints.dart';
import 'package:hog/data/models/app_response.dart';
import 'package:hog/data/providers/apiProvider/api_provider.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';

class HomeRepository {
  Future<AppResponse> getNews() async {
    try {
      var appResponse = await ApiProvider.get(
          url: newsUrl, token: CacheProvider.getAppToken());
      return AppResponse(
          success: true, errorMessage: null, data: appResponse.data);
    } on DioException catch (e) {
      return AppResponse(
          success: false, errorMessage: e.message ?? e.toString(), data: null);
    }
  }
}
