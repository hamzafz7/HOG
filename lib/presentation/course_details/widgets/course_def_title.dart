import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';

class CourseDefineTitle extends StatelessWidget {
  const CourseDefineTitle(
      {super.key, required this.titleName, required this.width});
  final String titleName;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(titleName,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.bodyMedium!)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 1.h,
              width: width,
              color: kprimaryBlueColor,
            ),
            Container(
              height: 3.h,
              width: 3.w,
              decoration: const BoxDecoration(
                  color: kprimaryBlueColor, shape: BoxShape.circle),
            )
          ],
        )
      ],
    );
  }
}
