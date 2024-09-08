import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/presentation/splashpage/controller/splash_controller.dart';

class SplashPage extends GetView<SplashPageController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashPageController());
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            SizedBox(
              height: 130.h,
            ),
            Image.asset("assets/images/logo.png"),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "House Of",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "Geniuses",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 63.w,
              height: 2.h,
              color: ksecondaryColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "التعلم والمهارة والإبداع هدفك",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.black.withOpacity(0.6100000143051147),
                  ),
            ),
            SizedBox(
              height: 59.h,
            ),
            // CustomButton()
          ],
        ),
      ),
    );
  }
}
