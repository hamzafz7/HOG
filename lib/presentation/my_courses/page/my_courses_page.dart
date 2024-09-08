import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/common/constants/constants.dart';
import 'package:hog/common/constants/enums/request_enum.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';
import 'package:hog/presentation/my_courses/controllers/my_courses_controller.dart';
import 'package:hog/presentation/my_courses/widgets/my_course_container.dart';

class MyCoursesPage extends GetView<MyCoursesController> {
  const MyCoursesPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyCoursesController());
    return Scaffold(
        body: RefreshIndicator(
      color: kprimaryBlueColor,
      onRefresh: () async {
        controller.getMyCourses(CacheProvider.getUserId());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          // const MyCoursesPageHeader(),
          // SizedBox(
          //   height: 30.h,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Text('كورساتي',
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodyLarge!),
              ),
              const Spacer(),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 14.0.h, horizontal: 20.w),
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 45.h,
                  width: 45.w,
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(() => switch (controller.getMyCoursesStatus.value) {
                  RequestStatus.success => ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: controller.model!.courses!.length,
                      itemBuilder: (context, index) => MyCourseCotainer(
                            courseModel: controller.model!.courses![index],
                          )),
                  RequestStatus.loading => Center(
                      child: appCircularProgress(),
                    ),
                  RequestStatus.noData => const Center(
                      child: Text("لا يوجد بيانات"),
                    ),
                  RequestStatus.onError => const Center(
                      child: Text(" حدث خطأ"),
                    ),
                  RequestStatus.begin => const Center(
                      child: Text(""),
                    ),
                  RequestStatus.noInternentt => const Center(
                      child: Text("لا يوجد اتصال بالشبكة"),
                    ),
                }),
          ),
        ],
      ),
    ));
  }
}
