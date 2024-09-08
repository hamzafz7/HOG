import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/common/routes/app_routes.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';
import 'package:hog/presentation/onboarding/controllers/onboarding_controller.dart';
import 'package:hog/presentation/onboarding/widgets/onboarding_container.dart';
import 'package:hog/presentation/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:svg_flutter/svg_flutter.dart';

class OnBoardingPage extends GetView<OnBoardingPageController> {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingPageController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 60.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {
                  Get.offAllNamed(AppRoute.loginPageRoute);
                  CacheProvider().setIsOnBoardingOpened(true);
                },
                child: const Text(
                  "تخطي",
                  style: TextStyle(color: kprimaryGreyColor),
                )),
          ),
          SizedBox(
            height: 500.h,
            child: PageView.builder(
              onPageChanged: (val) {},
              controller: controller.pageController,
              itemCount: controller.onboardingScreens.length,
              itemBuilder: (context, index) => OnBoardingContainer(
                  model: controller.onboardingScreens[index]),
            ),
          ),
          Center(
              child: SmoothPageIndicator(
                  effect: WormEffect(
                      activeDotColor: kprimaryBlueColor, dotHeight: 10.h),
                  controller: controller.pageController,
                  count: 3)),
          SizedBox(
            height: 72.h,
          ),
          Center(
            child: CustomButton(
              onTap: () {
                if (controller.pageController.page == 2) {
                  Get.offAllNamed(AppRoute.loginPageRoute);
                  CacheProvider().setIsOnBoardingOpened(true);
                } else {
                  controller.pageController
                      .jumpToPage(controller.pageController.page!.toInt() + 1);
                }
              },
              height: 56.h,
              width: 56.h,
              child: SvgPicture.asset("assets/icons/arrow-right.svg"),
            ),
          )
        ],
      ),
    );
  }
}
