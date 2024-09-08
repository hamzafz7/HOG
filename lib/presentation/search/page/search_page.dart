import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/constants.dart';
import 'package:hog/common/constants/enums/request_enum.dart';
import 'package:hog/presentation/homepage/widgets/home_course_item.dart';
import 'package:hog/presentation/search/controller/search_controller.dart';
import 'package:hog/presentation/search/widgets/custom_seach_feild.dart';

class SearchPage extends GetView<SearchPageController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchPageController());
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            CustomSearchFeild(
              searchController: controller.searchController,
              onChanged: (val) {
                if (val.isNotEmpty &&
                    controller.searchController.text.isNotEmpty) {
                  controller.searchCourse(val);
                }
                if (val.isEmpty || controller.searchController.text.isEmpty) {
                  controller.updatecourseStatus(RequestStatus.begin);
                }
              },
            ),
            Obx(() => Center(
                  child: switch (controller.courseStatus.value) {
                    RequestStatus.success => GridView.count(
                        childAspectRatio: 1 / 1.7,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(
                            controller.coursesModel!.courses!.length,
                            (index) => HomeCourseItem(
                                  courseModel:
                                      controller.coursesModel!.courses![index],
                                )),
                      ),
                    RequestStatus.begin => Container(),
                    RequestStatus.loading => Center(
                        child: appCircularProgress(),
                      ),
                    RequestStatus.onError => Center(
                        child: Text(
                          "حدث خطأ ما",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    RequestStatus.noData => Center(
                        child: Text(
                          "لا يوجد أي كورس بهذا الاسم",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    RequestStatus.noInternentt => Center(
                          child: Text(
                        "لا يوجد إتصال بلإنترنت",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
                  },
                ))
          ],
        ),
      ),
    );
  }
}
