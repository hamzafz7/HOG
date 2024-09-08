import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hog/data/endpoints.dart';
import 'package:hog/data/models/app_response.dart';
import 'package:hog/data/models/user_model.dart';
import 'package:hog/data/providers/apiProvider/api_provider.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';

class AccountRepo {
  Future<AppResponse> userLogin(User model) async {
    try {
      var response = await ApiProvider.post(
        url: loginUrl,
        body: model.loginUserToJson(),
      );
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

  Future<AppResponse> userRegister(User model) async {
    try {
      var response = await ApiProvider.post(
        url: registerUrl,
        body: model.registerUserToJson(),
      );
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

  Future<AppResponse> signOut() async {
    try {
      final response = await ApiProvider.post(
        url: logOutUrl,
        token: CacheProvider.getAppToken(),
      );
      return AppResponse(
        errorMessage: null,
        data: response.data,
        success: true,
      );
    } on DioException catch (e) {
      return AppResponse(
        errorMessage: e.message ?? e.toString(),
        data: null,
        success: false,
      );
    }
  }

  Future<AppResponse> deleteProfile() async {
    try {
      final response = await ApiProvider.delete(
        url: '$deleteProfileUrl/${CacheProvider.getUserId()}',
        token: CacheProvider.getAppToken(),
      );
      return AppResponse(
        errorMessage: null,
        data: response.data,
        success: true,
      );
    } on DioException catch (e) {
      return AppResponse(
        errorMessage: e.message ?? e.toString(),
        data: null,
        success: false,
      );
    }
  }

  Future<AppResponse> getMyProfile() async {
    try {
      final response = await ApiProvider.get(
        url: getProfileUrl,
        token: CacheProvider.getAppToken(),
      );
      return AppResponse(
        errorMessage: null,
        data: response.data,
        success: true,
      );
    } on DioException catch (e) {
      return AppResponse(
        errorMessage: e.message ?? e.toString(),
        data: null,
        success: false,
      );
    } on HttpException catch (e) {
      return AppResponse(
        errorMessage: e.message,
        data: null,
        success: false,
      );
    }
  }

  Future<AppResponse> updateProfile(User user) async {
    Map<String, dynamic> toJson = await user.updateUserToJSon();
    try {
      final response = await ApiProvider.post(
          url: "$updateProfileUrl/${user.id}",
          token: CacheProvider.getAppToken(),
          body: FormData.fromMap(toJson));
      return AppResponse(
        errorMessage: null,
        data: response.data,
        success: true,
      );
    } on DioException catch (e) {
      return AppResponse(
        errorMessage: e.message ?? e.toString(),
        data: null,
        success: false,
      );
    }
  }
}
