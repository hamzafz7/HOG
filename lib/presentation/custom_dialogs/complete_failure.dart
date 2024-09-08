import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:svg_flutter/svg.dart';

class CompleteFailureWidget extends StatelessWidget {
  const CompleteFailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/wrong_sign.svg",
            // ignore: deprecated_member_use
            color: kprimaryPinkColor,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "عذراً",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 270.w,
              child: Text(
                "  لا يمكنك مشاهدة هذا الدرس  قبل الانضمام إلى الكورس",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: kprimaryGreyColor, fontSize: 16.sp),
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          // CustomButton(
          //   height: 42.h,
          //   width: 311.w,
          //   borderRadius: 8.r,
          //   child: Text(
          //     "انضم الآن",
          //     style: Theme.of(context)
          //         .textTheme
          //         .bodyMedium!
          //         .copyWith(color: Colors.white, fontSize: 14.sp),
          //   ),
          // )
        ]);
  }
}
