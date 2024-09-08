import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hog/presentation/course_details/controller/course_details_controller.dart';
import 'package:hog/presentation/course_details/widgets/custom_list_tile.dart';

class CourseCurriculum extends StatelessWidget {
  CourseCurriculum({super.key});
  final controller = Get.find<CourseDetailsController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.courseInfoModel!.course!.chapters!.length,
            itemBuilder: (context, index) => CustomListTile(
                chapterModel:
                    controller.courseInfoModel!.course!.chapters![index])),
      ],
    );
  }
}
