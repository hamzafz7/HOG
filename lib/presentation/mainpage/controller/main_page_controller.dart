import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hog/presentation/homepage/pages/home_page.dart';
import 'package:hog/presentation/my_courses/page/my_courses_page.dart';
import 'package:hog/presentation/profile/pages/my_profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainPageController extends GetxController {
  RxInt currentPageIndex = 1.obs;
  PersistentTabController bottomNavController =
      PersistentTabController(initialIndex: 1);
  changeCurrentPage(int ind) {
    currentPageIndex.value = ind;
  }

  List<Widget> screens = const [MyProfilePage(), HomePage(), MyCoursesPage()];
}
