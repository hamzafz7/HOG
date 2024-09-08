import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ResultButtonWidget extends StatelessWidget {
  const ResultButtonWidget(
      {super.key,
      required this.color,
      required this.svgURL,
      this.ontap,
      required this.text});
  final Color color;
  final String svgURL;
  final String text;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(child: SvgPicture.asset(svgURL)),
          ),
        ),
        Text(text)
      ],
    );
  }
}
