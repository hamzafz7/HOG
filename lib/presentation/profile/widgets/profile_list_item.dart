// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem(
      {super.key,
      required this.svgUrl,
      required this.onTap,
      required this.text});
  final String text;
  final Function()? onTap;
  final String svgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: GestureDetector(
          onTap: onTap,
          child: SizedBox(
            child: Row(
              children: [
                Container(
                  width: 36.w,
                  height: 34.h,
                  decoration: ShapeDecoration(
                    color: const Color(0x190794EB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: SvgPicture.asset(
                    svgUrl,
                    color: kprimaryBlueColor,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.labelMedium!,
                )
              ],
            ),
          )),
    );
  }
}
