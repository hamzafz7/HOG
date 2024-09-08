import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/routes/app_routes.dart';
import 'package:hog/presentation/profile/widgets/profile_list_item.dart';
import 'package:hog/presentation/settings/controller/setting_controller.dart';
import 'package:hog/presentation/widgets/custom_appbar.dart';

class SettingsPage extends GetView<SettingController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return Scaffold(
      appBar: const CustomAppBar(text: "الإعدادات"),
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          ProfileListItem(
              svgUrl: "assets/icons/Lock.svg",
              onTap: () {
                Get.toNamed(AppRoute.privacyPolicyRoute);
              },
              text: "سياسة الخصوصية"),
          SizedBox(
            height: 25.h,
          ),
          ProfileListItem(
              svgUrl: "assets/icons/alert-circle.svg",
              onTap: () {
                Get.toNamed(AppRoute.aboutUsPageRoute);
              },
              text: "حولنا"),
          SizedBox(
            height: 25.h,
          ),
          ProfileListItem(
              svgUrl: "assets/icons/Message.svg",
              onTap: () {
                controller.launchWhatsAppURL();
              },
              text: "تواصل معنا")
        ],
      ),
    );
  }
}
