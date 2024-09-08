// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ResultGradeStack extends StatelessWidget {
  const ResultGradeStack({super.key, required this.res});
  final double res;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40.sp),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/outer_res.svg",
            // fit: BoxFit.none,
            height: 160.h,
            width: 160.w,
          ),
          SvgPicture.asset(
            'assets/images/inner.svg',
            // fit: BoxFit.none,
            height: 140.h,
            width: 140.w,
          ),
          CircleAvatar(
            radius: 60.r,
            backgroundColor: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "نتيجتك",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: kprimaryBlueColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${(res * 100).toInt()}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: kprimaryBlueColor, fontSize: 32.sp),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
