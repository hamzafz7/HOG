import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/common/constants/constants.dart';
import 'package:hog/common/constants/enums/request_enum.dart';
import 'package:hog/presentation/course_details/controller/course_details_controller.dart';
import 'package:hog/presentation/course_details/widgets/custom_feild.dart';
import 'package:hog/presentation/widgets/custom_button.dart';

class CodeActivationWidget extends StatelessWidget {
  const CodeActivationWidget(
      {super.key,
      required this.controller,
      required this.onValidate,
      this.onTap});
  final TextEditingController controller;
  final String? Function(String?) onValidate;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 30.h,
        ),
        Text('انضم الآن ',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: kprimaryBlueColor)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('قم بكتابة كود التفعيل الخاص بك للانضمام إلى الكورس',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: kprimaryGreyColor)),
        ),
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomActivationFeild(
            // feildHeight: 50.h,
            text: 'ادخل رمز التفعيل',
            controller: controller,
            onValidate: onValidate,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Obx(() =>
            Get.find<CourseDetailsController>().signInCourseStatus.value ==
                    RequestStatus.loading
                ? Center(
                    child: appCircularProgress(),
                  )
                : CustomButton(
                    width: 280.w,
                    borderRadius: 10,
                    onTap: onTap,
                    child: Text(
                      "ادخل الرمز",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ))
      ],
    );
  }
}
