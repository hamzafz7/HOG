import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/data/endpoints.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';

class MyCoursesPageHeader extends StatelessWidget {
  const MyCoursesPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('مرحبا ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: kprimaryGreyColor)),
              Text(CacheProvider.getUserName() ?? "UnKnown",
                  style: Theme.of(context).textTheme.bodyLarge!)
            ],
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: Container(
                height: 50.h,
                width: 50.w,
                decoration:
                    BoxDecoration(border: Border.all(color: kprimaryBlueColor)),
                child: CachedNetworkImage(
                  imageUrl: CacheProvider.getUserImage() != null
                      ? imagebaseUrl + CacheProvider.getUserImage()
                      : "https://img.freepik.com/free-vector/man-shows-gesture-great-idea_10045-637.jpg?w=740&t=st=1702746365~exp=1702746965~hmac=d69d2e417b17c8e24a04eabd7a5d0ca923eb3a5806a83f576d1f19f0da10318f",
                  height: 50.h,
                  width: 50.w,
                  fit: BoxFit.fill,
                )),
          )
        ],
      ),
    );
  }
}
