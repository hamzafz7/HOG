import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/enums/request_enum.dart';
import 'package:hog/common/routes/app_routes.dart';
import 'package:hog/data/models/auth_model.dart';
import 'package:hog/data/models/user_model.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';
import 'package:hog/data/repositories/account_repo.dart';

class RegisterationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController loginPhoneController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();

  var loginPageFormKey = GlobalKey<FormState>();
  var registerPageFormKey = GlobalKey<FormState>();

  var loginRequestStatus = RequestStatus.begin.obs;
  var registerRequestStatus = RequestStatus.begin.obs;

  uptateLoginRequestStatus(RequestStatus val) => loginRequestStatus.value = val;
  uptateRegisterRequestStatus(RequestStatus val) =>
      registerRequestStatus.value = val;

  RxBool isloginpasswordShown = false.obs;

  final AccountRepo _repo = AccountRepo();

  changeIsLoginPasswordShown() {
    isloginpasswordShown.value = !isloginpasswordShown.value;
  }

  AuthResponse? authResponse;

  Future<void> userLogin(
      {required String phone, required String password}) async {
    uptateLoginRequestStatus(RequestStatus.loading);

    User user = User(password: password.trim(), phone: phone.trim());

    var response = await _repo.userLogin(user);
    if (response.success) {
      authResponse = AuthResponse.fromJson(response.data);
      Get.snackbar("مرحباً !!", authResponse!.message!);
      CacheProvider.setUserId(authResponse!.data!.user!.id!);
      CacheProvider.setUserName(authResponse!.data!.user!.fullName!);
      CacheProvider.setAppToken(authResponse!.data!.token!);
      CacheProvider.setUserType(authResponse!.data!.user!.type);
      Get.offAllNamed(AppRoute.mainPageRoute);
      uptateLoginRequestStatus(RequestStatus.success);
    } else {
      uptateLoginRequestStatus(RequestStatus.onError);
      Get.snackbar("حدث خطأ", response.errorMessage!);
    }
  }

  Future<void> userRegister(
      {required String phone,
      required String password,
      required String fullName}) async {
    uptateRegisterRequestStatus(RequestStatus.loading);

    User user = User(
        password: password.trim(),
        phone: phone.trim(),
        fullName: fullName.trim());

    var response = await _repo.userRegister(user);
    if (response.success) {
      authResponse = AuthResponse.fromJson(response.data);
      Get.snackbar("مرحباً !!", authResponse!.message!);
      CacheProvider.setUserId(authResponse!.data!.user!.id!);
      CacheProvider.setUserName(authResponse!.data!.user!.fullName!);
      CacheProvider.setAppToken(authResponse!.data!.token!);
      CacheProvider.setUserType(authResponse!.data!.user!.type);

      Get.offAllNamed(AppRoute.mainPageRoute);
      uptateRegisterRequestStatus(RequestStatus.success);
    } else {
      uptateRegisterRequestStatus(RequestStatus.onError);
      Get.snackbar("حدث خطأ", response.errorMessage!);
    }
  }
}
