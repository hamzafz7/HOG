// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/common/routes/app_routes.dart';
import 'package:hog/presentation/homepage/controller/home_controller.dart';
import 'package:hog/presentation/homepage/widgets/home_course_item.dart';
import 'package:svg_flutter/svg_flutter.dart';

// ignore: must_be_immutable
class CoursesWidget extends StatelessWidget {
  CoursesWidget({super.key});

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: SizedBox(
                  width: 220.w,
                  child: Text(
                    controller
                        .categoriesModel!
                        .categories![controller.currentCategoryIndex.value]
                        .name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14.sp),
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.yearsPageRoute);
                  },
                  child: Row(
                    children: [
                      Text(
                        'رؤية المزيد',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              decorationColor: kprimaryBlueColor,
                              color: kprimaryBlueColor,
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                      SvgPicture.asset(
                        "assets/icons/arrow-right.svg",
                        color: kprimaryBlueColor,
                        height: 15.h,
                      ),
                    ],
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        GridView.count(
          childAspectRatio: 1 / 1.7,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: List.generate(
              controller.coursesModel!.courses!.length >= 4
                  ? 4
                  : controller.coursesModel!.courses!.length,
              (index) => HomeCourseItem(
                    courseModel: controller.coursesModel!.courses![index],
                  )),
        )
      ],
    );
  }
}
