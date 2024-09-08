import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/common/routes/app_routes.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoute.searchPageRoute);
      },
      child: Container(
        height: 50.h,
        width: 360.w,
        decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(40.r),
            boxShadow: const [
              BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.grey)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Icon(Icons.search),
            SizedBox(
              width: 20.w,
            ),
            Text(
              "ابحث عن المزيد من الكورسات",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: kprimaryGreyColor),
            ),
          ]),
        ),
      ),
    );
  }
}
