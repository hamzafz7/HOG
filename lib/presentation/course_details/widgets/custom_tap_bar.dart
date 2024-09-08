import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';
import 'package:hog/presentation/course_details/controller/course_details_controller.dart';

class CustomTapBar extends GetView<CourseDetailsController> {
  const CustomTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CourseDetailsController());
    return Container(
      padding: REdgeInsets.all(5),
      decoration: BoxDecoration(
        color: !CacheProvider.getAppTheme()
            ? Colors.white
            : Color.fromARGB(255, 187, 212, 233),
        borderRadius: BorderRadius.circular(15),
        // border: Border.all(color: kprimaryBlueColor)),
      ),
      margin: REdgeInsets.all(20.r),
      child: TabBar(
        onTap: (index) {
          controller.updateCurrentTabIndex(index);
        },
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          color: kprimaryBlueColor,
        ),
        dividerHeight: 0,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        tabs: [
          Tab(
            child: SizedBox(
              width: 90.w,
              child: Center(
                child: Text(
                  "الوصف",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 90.w,
              child: Center(
                child: Text(
                  "المنهاج",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
          Tab(
            child: SizedBox(
              width: 90.w,
              child: Center(
                child: Text(
                  "المحفوظات",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
