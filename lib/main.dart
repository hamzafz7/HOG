import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hog/common/routes/app_routes.dart';
import 'package:hog/common/themes/themes.dart';
import 'package:hog/data/httpClient.dart';
import 'package:hog/data/providers/apiProvider/api_provider.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';
import 'package:hog/data/providers/databaseProvider/course_database.dart';
import 'package:hog/data/providers/databaseProvider/video_database.dart';
import 'package:hog/data/providers/notificationProvider/notification_provider.dart';
import 'package:hog/presentation/splashpage/page/splash_page.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();
  await CacheProvider.init();
  await ApiProvider.init();
  await VideoDatabase.database;
  await CourseDatabase.database;
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await FireBaseAPi().initNotifications();
  secureScreen();
  HttpOverrides.global = MyHttpOverrides();
  if (CacheProvider().getDeviceId() == null) {
    await CacheProvider().setDeviceId();
    runApp(const MyApp());
  } else {
    runApp(const MyApp());
  }
}

Future<void> secureScreen() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _isRealDevice(),
        builder: (context, snapshot) => ScreenUtilInit(
            designSize: const Size(393, 852),
            builder: (context, child) =>
                snapshot.hasData && snapshot.data == true
                    ? GetMaterialApp(
                        debugShowCheckedModeBanner: false,
                        theme: lighttheme,
                        darkTheme: darkTheme,
                        themeMode: CacheProvider.getAppTheme()
                            ? ThemeMode.dark
                            : ThemeMode.light,
                        locale: const Locale('ar'),
                        getPages: AppRoute.pages,
                        home: const SplashPage(),
                      )
                    : const SizedBox()));
  }

  Future<bool> _isRealDevice() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Theme.of(context).platform == TargetPlatform.android) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.isPhysicalDevice ?? false;
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.isPhysicalDevice;
    } else {
      return false;
    }
  }
}
