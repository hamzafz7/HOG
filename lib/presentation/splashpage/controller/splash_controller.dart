import 'package:get/get.dart';
import 'package:hog/common/routes/app_routes.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      if (CacheProvider.getIsOnBoardingOpened() == null) {
        Get.offAllNamed(AppRoute.onboardingPageRoute);
      } else if (CacheProvider.getAppToken() == null) {
        Get.offAllNamed(AppRoute.loginPageRoute);
      } else {
        Get.offAllNamed(AppRoute.mainPageRoute);
      }
    });
    super.onInit();
  }
}
