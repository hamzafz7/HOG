import 'package:dio/dio.dart';
import 'package:hog/data/endpoints.dart';
import 'package:hog/data/models/app_response.dart';
import 'package:hog/data/providers/apiProvider/api_provider.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';

class CategoryRepository {
  Future<AppResponse> getCategories() async {
    try {
      var response = await ApiProvider.get(
          url: categoriesUrl, token: CacheProvider.getAppToken());
      return AppResponse(
        errorMessage: null,
        data: response.data,
        success: true,
      );
    } on DioException catch (e) {
      return AppResponse(
        errorMessage: e.message,
        data: null,
        success: false,
      );
    }
  }

  Future<AppResponse> getCourses(int id) async {
    try {
      var response = await ApiProvider.get(
          url: "$coursesUrl/$id", token: CacheProvider.getAppToken());
      return AppResponse(
        errorMessage: null,
        data: response.data,
        success: true,
      );
    } on DioException catch (e) {
      return AppResponse(
        errorMessage: e.message,
        data: null,
        success: false,
      );
    }
  }

  Future<AppResponse> searchCourses(String searchText) async {
    try {
      var response = await ApiProvider.get(
          url: searchCoursesUrl,
          token: CacheProvider.getAppToken(),
          query: {"search": searchText});
      return AppResponse(
        errorMessage: null,
        data: response.data,
        success: true,
      );
    } on DioException catch (e) {
      return AppResponse(
        errorMessage: e.message,
        data: null,
        success: false,
      );
    }
  }

  Future<AppResponse> getCourseInfo(int id) async {
    try {
      var response = await ApiProvider.get(
          url: "$showCourseUrl/$id", token: CacheProvider.getAppToken());
      return AppResponse(
        errorMessage: null,
        data: response.data,
        success: true,
      );
    } on DioException catch (e) {
      return AppResponse(
        errorMessage: e.message,
        data: null,
        success: false,
      );
    }
  }

  Future<AppResponse> getMyCourses(int id) async {
    try {
      var response = await ApiProvider.get(
          url: "users/$id/courses", token: CacheProvider.getAppToken());
      return AppResponse(
        errorMessage: null,
        data: response.data,
        success: true,
      );
    } on DioException catch (e) {
      return AppResponse(
        errorMessage: e.message,
        data: null,
        success: false,
      );
    }
  }

  Future<AppResponse> signInCourse(int id, String activationCode) async {
    try {
      var response = await ApiProvider.post(
          url: "$signInCourseUrl/$id",
          token: CacheProvider.getAppToken(),
          body: {"activation_code": activationCode});
      return AppResponse(
        errorMessage: null,
        data: response.data,
        success: true,
      );
    } on DioException catch (e) {
      return AppResponse(
        errorMessage: e.message,
        data: null,
        success: false,
      );
    }
  }

  Future<AppResponse> watchVideo(String link) async {
    try {
      print(CacheProvider.getAppToken());
      var appResponse = await ApiProvider.get(
          url: watchVidUrl,
          token: CacheProvider.getAppToken(),
          query: {"link": link});
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: true, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> downloadVideo(String link) async {
    try {
      var appResponse = await ApiProvider.get(
          url: downloadVidUrl,
          token: CacheProvider.getAppToken(),
          query: {"link": link});
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: true, data: null, errorMessage: e.message ?? e.toString());
    }
  }

  Future<AppResponse> isWatched(int id) async {
    try {
      var appResponse = await ApiProvider.post(
        url: "$isWatchedUrl/$id",
        token: CacheProvider.getAppToken(),
      );
      return AppResponse(
          success: true, data: appResponse.data, errorMessage: null);
    } on DioException catch (e) {
      return AppResponse(
          success: true, data: null, errorMessage: e.message ?? e.toString());
    }
  }
}
