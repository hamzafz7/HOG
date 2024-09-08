import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/common/constants/shimmer_effect.dart';
import 'package:hog/data/models/choice_model.dart';
import 'package:hog/presentation/quizzes/controllers/quiz_controller.dart';

// ignore: must_be_immutable
class AnswerWidget extends StatelessWidget {
  AnswerWidget({super.key, this.choice});
  var controller = Get.find<QuizController>();
  ChoiceModel? choice;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      builder: (_) => Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.white,
              ),
              child: Checkbox(
                hoverColor: kprimaryBlueColor,
                activeColor: kprimaryBlueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0.r),
                ),
                side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(width: 1.0, color: Colors.blue),
                ),
                value:
                    controller.userSolutions.containsKey(choice!.questionId!) &&
                        controller.userSolutions.containsValue(choice!.id!),
                onChanged: (value) {
                  controller.provideSolution(choice!.questionId!, choice!.id!);
                },
              ),
            ),
            Column(
              children: [
                if (choice!.image != null)
                  CachedNetworkImage(
                    width: 260.w,
                    height: 200.h,
                    fit: BoxFit.fill,
                    imageUrl: choice!.image!,
                    placeholder: ((context, url) => ShimmerPlaceholder(
                          child: Container(
                            height: 150.h,
                            width: 200.w,
                            color: Colors.black,
                          ),
                        )),
                  ),
                SizedBox(
                  width: 280.w,
                  child: Text(choice!.title ?? ""),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
