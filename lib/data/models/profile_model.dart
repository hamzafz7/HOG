import 'package:hog/data/models/user_model.dart';

class ProfileResponse {
  final User data;
  final String message;

  ProfileResponse({required this.data, required this.message});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      data: User.fromJson(json['data']),
      message: json['message'],
    );
  }
}
