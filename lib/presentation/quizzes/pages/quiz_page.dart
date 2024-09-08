import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/common/routes/app_routes.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';
import 'package:hog/presentation/quizzes/controllers/quiz_controller.dart';
import 'package:hog/presentation/quizzes/widgets/progress_header_widget.dart';
import 'package:hog/presentation/quizzes/widgets/question_widget.dart';
import 'package:hog/presentation/widgets/custom_button.dart';

class QuizzesPage extends GetView<QuizController> {
  const QuizzesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QuizController());
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: CacheProvider.getAppTheme()
            ? const Color.fromARGB(255, 7, 37, 61)
            : null,
        surfaceTintColor:
            CacheProvider.getAppTheme() ? kDarkBlueColor : Colors.white,
        title: Text(
          controller.model.title ?? "الاختبار",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProgressHeaderWidget(),
            GetBuilder<QuizController>(
              builder: (_) => ExpandablePageView.builder(
                onPageChanged: (val) {},
                physics: const NeverScrollableScrollPhysics(),
                animationDuration: const Duration(milliseconds: 0),
                controller: controller.pageController.value,
                itemCount: controller.model.questions!.length,
                itemBuilder: (context, index) {
                  return QuestionPage(
                    index: index,
                    questionModel: controller.model.questions![index],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Center(
                child: CustomButton(
                  onTap: () {
                    if (controller.currentQuistions.value !=
                        controller.totalQuistions.value) {
                      controller.pageController.value
                          .jumpToPage(controller.currentIndex.value + 1);
                      controller.incrementQuistionsValue();
                    } else {
                      controller.calcResult();
                      Get.toNamed(AppRoute.quizStatisiticPageRoute);
                    }
                  },
                  width: 354.w,
                  height: 48.h,
                  child: Text(
                    "التالي",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    if (controller.currentQuistions.value > 1) {
                      controller.pageController.value
                          .jumpToPage(controller.currentIndex.value - 1);
                      controller.decrementQuistionsValue();
                    }
                  },
                  child: Text(
                    "الرجوع",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: kprimaryBlueColor,
                        decoration: TextDecoration.underline,
                        decorationColor: kprimaryBlueColor),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
