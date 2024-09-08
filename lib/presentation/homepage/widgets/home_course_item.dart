import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/common/constants/constants.dart';
import 'package:hog/common/constants/shimmer_effect.dart';
import 'package:hog/common/routes/app_routes.dart';
import 'package:hog/data/models/courses_model.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';
import 'package:hog/presentation/widgets/custom_button.dart';
import 'package:svg_flutter/svg_flutter.dart';

class HomeCourseItem extends StatelessWidget {
  const HomeCourseItem({super.key, required this.courseModel});
  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 187.w,
        height: 360.h,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: kprimarwhiteColor),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 12.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                imageUrl: courseModel.image ?? defPic,
                height: 136.h,
                width: 166.w,
                fit: BoxFit.fill,
                placeholder: (context, string) {
                  return ShimmerPlaceholder(
                      child: Container(
                    height: 136.h,
                    color: Colors.black,
                  ));
                },
                errorWidget: (context, url, obj) {
                  return ShimmerPlaceholder(
                      child: Container(
                    height: 136.h,
                    color: Colors.black,
                  ));
                },
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SvgPicture.asset(
                  "assets/icons/users.svg",
                  height: 15.h,
                  width: 15.w,
                ),
                SizedBox(
                  width: 5.w,
                ),
                SizedBox(
                    width: 120.w,
                    height: 30.h,
                    child: Wrap(
                        // scrollDirection: Axis.horizontal,
                        // padding: EdgeInsets.zero,
                        // itemCount: courseModel.teachers!.length,
                        children: List.generate(
                            courseModel.teachers!.length > 3
                                ? 3
                                : courseModel.teachers!.length,
                            (index) => Text(
                                  "${courseModel.teachers![index]}${index != courseModel.teachers!.length - 1 ? "," : ""}",
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          fontSize: 10.sp,
                                          color: ksecondaryGreyColor),
                                ))))
              ]),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: SizedBox(
                width: 150.w,
                child: Text(
                  courseModel.name ?? "لا يوجد اسم لهذا الكورس",
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 3,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoute.courseDetailsPageRoute,
                    arguments: courseModel);
              },
              height: 40.h,
              width: 110.w,
              borderRadius: 6.r,
              child: Text(
                courseModel.isPaid != true &&
                        courseModel.isOpen != true &&
                        (courseModel.isTeachWithCourse != true ||
                            courseModel.isTeachWithCourse == null) &&
                        CacheProvider.getUserType() != 'admin'
                    ? "انضم الأن"
                    : 'تابع',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
