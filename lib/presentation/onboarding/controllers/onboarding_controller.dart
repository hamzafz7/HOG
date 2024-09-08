import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hog/data/models/onboarding_model.dart';

class OnBoardingPageController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  final List<OnBoardingModel> onboardingScreens = [
    OnBoardingModel(
        body:
            "مكتبة بيت العباقرة سعيدة جداً باهتمامك للإنضمام لها , والحصول على أفضل المعلومات والشروحات",
        imageSrc: "assets/images/onBoarding1.svg",
        title: "جميع الدورات المطلوبة"),
    OnBoardingModel(
        body:
            "تهتم بيت العباقرة بشرح المواد الخاصة بطلاب الاقتصاد , ومحاولة تبسيط الدروس للحصول على أفضل الدرجات",
        imageSrc: "assets/images/onBoarding2.svg",
        title: "في جميع الأوقات"),
    OnBoardingModel(
        body:
            "تقدم بيت العباقرة منهجية متكاملة ومدروسة لتحسين مستوى الطالب باستمرار , سارع بالإنضمام الآن",
        imageSrc: "assets/images/onBoarding3.svg",
        title: "اختبر مدى فهمك "),
  ];
}
