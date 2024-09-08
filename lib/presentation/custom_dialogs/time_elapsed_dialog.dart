import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:svg_flutter/svg.dart';

class TimeElapsedDialog extends StatelessWidget {
  const TimeElapsedDialog({super.key, required this.timeElapsed});
  final int timeElapsed;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 90.h,
            width: 90.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ksecondaryColor,
            ),
            child:
                Center(child: SvgPicture.asset("assets/images/clock (1).svg")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "الوقت المستغرق",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  const TextSpan(
                    text:
                        'الوقت التقريبي المستغرق  خلال  إجراء الاختبار الأول  هو ',
                    style: TextStyle(color: kprimaryGreyColor),
                  ),
                  TextSpan(
                    text: '$timeElapsed:00  دقائق ',
                    style: const TextStyle(color: ksecondaryColor),
                  ),
                  const TextSpan(
                    text: 'من ',
                    style: TextStyle(color: kprimaryGreyColor),
                  ),
                  const TextSpan(
                    text: '60:00  دقائق',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          )
        ]);
  }
}
