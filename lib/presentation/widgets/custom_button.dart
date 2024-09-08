import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.height = 55,
      this.width = 252,
      this.onTap,
      this.child,
      this.borderRadius,
      this.bottomColor = kprimaryBlueColor});

  final double? height;
  final double? width;
  final Function()? onTap;
  final Widget? child;
  final double? borderRadius;
  final Color bottomColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: ShapeDecoration(
          color: bottomColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 30.r),
          )),
      child: MaterialButton(
        onPressed: onTap,
        minWidth: width!.w,
        height: height!.h,
        padding: EdgeInsets.symmetric(vertical: 13.h),
        child: Center(child: child),
      ),
    );
  }
}
