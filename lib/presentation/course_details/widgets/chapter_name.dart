import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/data/models/chapter_model.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';

class ChapterName extends StatelessWidget {
  const ChapterName({super.key, this.chapterModel});
  final ChapterModel? chapterModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Text(
          //   "01",
          //   style: Theme.of(context)
          //       .textTheme
          //       .bodyMedium!
          //       .copyWith(color: kprimaryGreyColor),
          // ),
          Container(
              height: 10.h,
              width: 10.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: !CacheProvider.getAppTheme()
                      ? Colors.black
                      : Colors.white)),
          SizedBox(
            width: 5.w,
          ),

          SizedBox(
            width: 300.w,
            child: Text(
              chapterModel!.name ?? "لا يوجد اسم لهذا الفصل",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: kprimaryGreyColor),
            ),
          )
        ],
      ),
    );
  }
}
