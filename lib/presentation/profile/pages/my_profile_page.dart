import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/common/constants/constants.dart';
import 'package:hog/common/constants/enums/request_enum.dart';
import 'package:hog/common/routes/app_routes.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';
import 'package:hog/presentation/controllers/themeController.dart';
import 'package:hog/presentation/custom_dialogs/custom_dialogs.dart';
import 'package:hog/presentation/custom_dialogs/delete_account_dialog.dart';
import 'package:hog/presentation/custom_dialogs/log-out.dart';
import 'package:hog/presentation/profile/controllers/profile_controller.dart';
import 'package:hog/presentation/profile/widgets/my_profile_header.dart';
import 'package:hog/presentation/profile/widgets/my_profile_image.dart';
import 'package:hog/presentation/profile/widgets/profile_list_item.dart';

// ignore: must_be_immutable
class MyProfilePage extends GetView<MyProfileController> {
  const MyProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyProfileController());
    return Scaffold(
      body: RefreshIndicator(
        color: kprimaryBlueColor,
        onRefresh: () async {
          controller.getMyProfile();
        },
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(children: [
              const MyProfileHeader(),
              SizedBox(
                height: 25.h,
              ),
              Obx(
                () => controller.getProfileStatus.value == RequestStatus.loading
                    ? Center(
                        child: appCircularProgress(),
                      )
                    : controller.getProfileStatus.value == RequestStatus.onError
                        ? const Center(
                            child: Text("حدث خطأ"),
                          )
                        : controller.getProfileStatus.value ==
                                RequestStatus.noInternentt
                            ? const Center(
                                child: Text("لا يوجد اتصال في الإننرنت"),
                              )
                            : Column(
                                children: [
                                  MyProfileImage(),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(CacheProvider.getUserName() ?? " ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                  SizedBox(
                                    height: 45.h,
                                  ),
                                  ProfileListItem(
                                      svgUrl: "assets/icons/person.svg",
                                      onTap: () {
                                        Get.toNamed(AppRoute.userInfoPageRoute);
                                      },
                                      text: "الملف الشخصي"),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  ProfileListItem(
                                      svgUrl: "assets/icons/settings.svg",
                                      onTap: () {
                                        Get.toNamed(AppRoute.settingsPageRoute);
                                      },
                                      text: "الإعدادات"),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Obx(
                                    () => controller.logOutStatus.value ==
                                            RequestStatus.loading
                                        ? appCircularProgress()
                                        : ProfileListItem(
                                            svgUrl: "assets/icons/log-out.svg",
                                            onTap: () {
                                              CustomDialog(context, child:
                                                  LogOutDialog(onPressed: () {
                                                controller.logOut();

                                                Get.back();
                                              }), height: 250, width: 390);
                                            },
                                            text: "تسجيل الخروج"),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Row(
                                    children: [
                                      ProfileListItem(
                                          svgUrl: "assets/icons/sun.svg",
                                          onTap: () {},
                                          text: "الوضع الليلي"),
                                      const Spacer(),
                                      GetBuilder(
                                          init: ThemeController(),
                                          builder: (cnt) {
                                            return Switch.adaptive(
                                                activeColor: Colors.blue,
                                                inactiveThumbColor: Colors.blue,
                                                trackOutlineColor:
                                                    MaterialStateProperty
                                                        .resolveWith((states) =>
                                                            Colors.blue),
                                                value: cnt.currentTheme ==
                                                    ThemeMode.dark,
                                                onChanged: (val) {
                                                  cnt.switchTheme();
                                                  Get.changeThemeMode(
                                                      cnt.currentTheme);
                                                });
                                          }),
                                      SizedBox(
                                        width: 40.w,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Obx(
                                    () =>
                                        controller.deleteProfileStatus.value ==
                                                RequestStatus.loading
                                            ? appCircularProgress()
                                            : ProfileListItem(
                                                svgUrl: "assets/icons/x.svg",
                                                onTap: () {
                                                  CustomDialog(context, child:
                                                      DeleteProfileDialog(
                                                          onPressed: () {
                                                    controller.deleteProfile();

                                                    Get.back();
                                                  }), height: 250, width: 390);
                                                },
                                                text: "حذف الحساب"),
                                  )
                                ],
                              ),
              ),
            ])),
      ),
    );
  }
}
