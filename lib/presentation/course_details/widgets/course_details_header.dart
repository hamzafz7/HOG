import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/constants.dart';
import 'package:hog/common/constants/shimmer_effect.dart';

class CourseDetailsHeader extends StatelessWidget {
  const CourseDetailsHeader({super.key, this.image, this.text});
  final String? image;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 337.h,
      width: Get.width,
      child: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height * 0.4,
            child: CachedNetworkImage(
              imageUrl: image ?? defPic,
              fit: BoxFit.fill,
              placeholder: (context, url) {
                return ShimmerPlaceholder(
                    child: Container(
                  height: Get.height * 0.4,
                  color: Colors.black,
                ));
              },
            ),
          ),
          SizedBox(
            width: Get.width,
            height: Get.height * 0.4,
            child: Image.asset(
              "assets/images/grey_pic.png",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0.r),
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
          Positioned(
            top: 120.h,
            bottom: 0,
            left: 10.w,
            right: 10.w,
            child: SizedBox(
              width: 300.w,
              child: Text(
                text ?? "لا يوجد اسم لهذا الكورس",
                textAlign: TextAlign.right,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white, fontSize: 36.sp),
                maxLines: 2,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
