class AppResponse<T> {
  bool success;
  T? data;
  String? errorMessage;

  AppResponse({required this.success, this.data, this.errorMessage});
}
