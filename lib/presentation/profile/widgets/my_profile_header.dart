import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class MyProfileHeader extends StatelessWidget {
  const MyProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/blue_container1.svg",
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text('حسابي',
                  style: Theme.of(context).textTheme.labelMedium!),
            ),
          )
        ],
      ),
    );
  }
}
