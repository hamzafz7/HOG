import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/presentation/widgets/custom_button.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CodeSuccessWidget extends StatelessWidget {
  const CodeSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset("assets/images/outer_container.svg"),
            Container(
                width: 86.75.w,
                height: 86.75.h,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                      radius: 0.7.r,
                      colors: const [Color(0x0F0794EB), Color(0x000794EB)]),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  "assets/images/inner_container.svg",
                )),
            SvgPicture.asset(
              "assets/images/blue_container.svg",
            ),
            const Icon(
              Icons.check,
              color: Colors.white,
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text('لقد تم التحقق من الرمز',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: kDarkBlueColor, fontSize: 20.sp)),
        ),
        Text('تم الانضمام بنجاح!',
            textAlign: TextAlign.right,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 18.sp, color: kprimaryBlueColor)),
        Text('تم التحقق من الرمز المدخل وانضمامك ضمن هذا الكورس بنجاح',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: kprimaryGreyColor)),
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: EdgeInsets.all(8.0.r),
          child: CustomButton(
            height: 42.h,
            width: 311.w,
            borderRadius: 8.r,
            child: Text(
              "الذهاب لرؤية الكورس",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white, fontSize: 14.sp),
            ),
          ),
        )
      ],
    );
  }
}
