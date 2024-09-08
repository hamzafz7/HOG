import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';

class AboutUsConatiner extends StatelessWidget {
  const AboutUsConatiner(
      {super.key,
      required this.color,
      required this.title,
      required this.body,
      required this.rightSide});
  final String title;
  final String body;
  final Color color;
  final bool rightSide;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: !CacheProvider.getAppTheme() ? Colors.white : null,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        child: Container(
          width: 345.w,
          height: 168.h,
          decoration: BoxDecoration(
            // color: Colors.white,
            border: Border(
                right: rightSide
                    ? BorderSide(
                        color: color,
                        width: 10.w,
                      )
                    : BorderSide.none,
                left: rightSide
                    ? BorderSide.none
                    : BorderSide(
                        color: color,
                        width: 10.w,
                      )),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
            child: Column(
                crossAxisAlignment: rightSide
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: color),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 288.w,
                    height: 100.38.h,
                    child: Text(body,
                        textAlign: rightSide ? TextAlign.right : TextAlign.left,
                        style: Theme.of(context).textTheme.bodySmall),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
