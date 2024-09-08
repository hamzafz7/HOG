import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/presentation/controllers/themeController.dart';
import 'package:hog/presentation/mainpage/controller/main_page_controller.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainPage extends GetView<MainPageController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainPageController());
    return Scaffold(
      extendBody: true,
      body: GetBuilder(
        init: ThemeController(),
        builder: (cnt) => PersistentTabView(
          context,
          controller: controller.bottomNavController,
          backgroundColor: cnt.currentTheme == ThemeMode.dark
              ? const Color.fromARGB(255, 7, 37, 61)
              : Colors.white,
          screens: controller.screens,
          items: [
            PersistentBottomNavBarItem(
                icon: const Icon(Icons.person),
                title: "حسابي",
                activeColorPrimary: kprimaryBlueColor,
                inactiveColorPrimary: Colors.grey,
                inactiveColorSecondary: Colors.grey),
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.home),
              title: "الرئيسية",
              activeColorPrimary: kprimaryBlueColor,
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.message),
              title: "كورساتي",
              activeColorPrimary: kprimaryBlueColor,
              inactiveColorPrimary: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
