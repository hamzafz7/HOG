import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/data/models/onboarding_model.dart';
import 'package:svg_flutter/svg_flutter.dart';

class OnBoardingContainer extends StatelessWidget {
  const OnBoardingContainer({super.key, required this.model});
  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            model.imageSrc,
            height: 270.h,
            width: Get.width - 30.w,
          ),
        ),
        SizedBox(
          height: 60.h,
        ),
        Text(
          model.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Text(
            model.body,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
