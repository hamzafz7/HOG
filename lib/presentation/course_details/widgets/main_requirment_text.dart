import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:svg_flutter/svg_flutter.dart';

class MainRequirementText extends StatelessWidget {
  const MainRequirementText({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset("assets/images/bulb.svg"),
          SizedBox(
            width: 5.w,
          ),
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: kprimaryGreyColor, fontSize: 14.sp),
          )
        ],
      ),
    );
  }
}
