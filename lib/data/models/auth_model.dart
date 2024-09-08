import 'package:hog/data/models/user_model.dart';

class AuthResponse {
  AuthData? data;
  final String? message;

  AuthResponse({required this.data, required this.message});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      data: AuthData.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class AuthData {
  final String? token;
  final User? user;

  AuthData({required this.token, required this.user});

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }
}
