import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/data/models/question_model.dart';
import 'package:hog/presentation/quizzes/controllers/quiz_controller.dart';
import 'package:hog/presentation/quizzes/widgets/answer_widget.dart';
import 'package:hog/presentation/quizzes/widgets/question_header_widget.dart';

// ignore: must_be_immutable
class QuestionPage extends StatelessWidget {
  QuestionPage({super.key, required this.index, required this.questionModel});
  final int index;
  var controller = Get.find<QuizController>();
  final QuestionModel? questionModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionHeaderWidget(
            index: index,
            title: questionModel!.title,
            image: questionModel!.image,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "أختر الإجابة الصحيحة:",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: 20.sp, letterSpacing: 0.0),
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.builder(
              controller: ScrollController(
                  initialScrollOffset: 0.0, keepScrollOffset: true),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: questionModel!.choices!.length,
              itemBuilder: (context, index) => AnswerWidget(
                    choice: questionModel!.choices![index],
                  )),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
