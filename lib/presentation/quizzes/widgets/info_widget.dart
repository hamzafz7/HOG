import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget(
      {super.key,
      required this.color,
      required this.text,
      required this.number});
  final String text;
  final Color color;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 12.h,
                  width: 12.w,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: color),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    number,
                    style: TextStyle(color: color),
                  ),
                ),
              ],
            ),
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: kDarkBlueColor),
          )
        ],
      ),
    );
  }
}
