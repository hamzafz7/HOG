// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';

class ThemeController extends GetxController {
  ThemeMode currentTheme =
      CacheProvider.getAppTheme() ? ThemeMode.dark : ThemeMode.light;

  // function to switch between themes
  void switchTheme() {
    currentTheme =
        currentTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    CacheProvider.setAppTheme(!CacheProvider.getAppTheme());
    update();
  }
}
