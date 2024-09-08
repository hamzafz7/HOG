import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/presentation/quizzes/controllers/quiz_controller.dart';
import 'package:hog/presentation/quizzes/widgets/info_widget.dart';

// ignore: must_be_immutable
class QuizInfoWidget extends StatelessWidget {
  QuizInfoWidget({super.key});
  var controller = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 366.w,
      height: 209.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          boxShadow: const [
            BoxShadow(
                blurRadius: 1,
                spreadRadius: 1,
                color: Color.fromARGB(255, 235, 230, 230))
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoWidget(
                  color: Colors.purple,
                  text: "عدد الاسئلة ",
                  number: "${controller.totalQuistions.value}"),
              const SizedBox(
                width: 40,
              ),
              InfoWidget(
                  color: Colors.blue,
                  text: "الاسئلة المتجاوزة",
                  number: "${controller.skippedQuistions.value}")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoWidget(
                  color: Colors.red,
                  text: "الإجابات الخاطئة",
                  number: "${controller.wrongAnswers.value}"),
              SizedBox(
                width: 60.w,
              ),
              InfoWidget(
                  color: Colors.green,
                  text: "الإجابات الصحيحة",
                  number:
                      "${controller.totalQuistions.value - controller.wrongAnswers.value - controller.skippedQuistions.value}")
            ],
          ),
        ],
      ),
    );
  }
}
