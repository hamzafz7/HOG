import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/presentation/quizzes/controllers/quiz_controller.dart';

// ignore: must_be_immutable
class ProgressHeaderWidget extends StatelessWidget {
  ProgressHeaderWidget({super.key});
  var controller = Get.find<QuizController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(10.r),
              value: controller.initalValue.value,
              minHeight: 10,
              valueColor: const AlwaysStoppedAnimation(kprimaryBlueColor),
              backgroundColor: Colors.grey[100],
              color: kprimaryBlueColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  " ${controller.currentQuistions.value}س",
                  style: const TextStyle(color: Colors.red),
                ),
                const Text(
                  " /",
                  style: TextStyle(color: kprimaryBlueColor),
                ),
                Text(
                  " ${controller.totalQuistions.value}س",
                  style: const TextStyle(color: kprimaryBlueColor),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    " ${controller.formattedTime}  دقيقة متبقية",
                    style: const TextStyle(color: kprimaryBlueColor),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
