import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';

class CustomNameText extends StatelessWidget {
  const CustomNameText({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
      child: Text(name,
          textAlign: TextAlign.right,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 14.sp, color: kprimaryGreyColor)),
    );
  }
}
