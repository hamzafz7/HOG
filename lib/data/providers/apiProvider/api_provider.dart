import 'package:dio/dio.dart';
import 'package:hog/data/endpoints.dart';
import 'package:hog/data/providers/apiProvider/interceptor.dart';
import 'package:hog/data/repositories/account_repo.dart';

// ignore: library_prefixes

class ApiProvider {
  static Dio? dio;
  static AccountRepo repository = AccountRepo();

  static init() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(milliseconds: 50000),
        receiveTimeout: const Duration(milliseconds: 30000),
        baseUrl: baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
      ),
    );
    dio!.interceptors.add(
      AppInterceptors(
        dio: dio,
        repo: repository,
      ),
    );
  }

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? data,
    String token = "",
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token != "" ? " Bearer $token" : "",
    };

    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> post({
    required String url,
    Map<String, dynamic>? query,
    Object? body,
    String? token = "",
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token != "" ? " Bearer $token" : "",
    };
    return await dio!.post(
      url,
      queryParameters: query,
      data: body,
    );
  }

  static Future<Response> patch({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? token = "",
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token != "" ? " Bearer $token" : "",
    };
    return await dio!.patch(
      url,
      queryParameters: query,
      data: body,
    );
  }

  static Future<Response> put({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? token = "",
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token != "" ? " Bearer $token" : "",
    };
    return await dio!.put(
      url,
      queryParameters: query,
      data: body,
    );
  }

  static Future<Response> delete({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? token = "",
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token != "" ? " Bearer $token" : "",
    };
    return await dio!.delete(
      url,
      queryParameters: query,
      data: body,
    );
  }
}
