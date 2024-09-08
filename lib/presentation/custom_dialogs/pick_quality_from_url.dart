import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/data/models/video_link_response.dart';
import 'package:hog/presentation/course_details/controller/course_details_controller.dart';
import 'package:hog/presentation/course_details/widgets/show_course_video.dart';
import 'package:hog/presentation/widgets/quality_button.dart';

class PickQualityFromUrl extends StatelessWidget {
  PickQualityFromUrl(
      {super.key,
      required this.response,
      this.description,
      required this.id,
      required this.name});
  final VideoLinksResponse response;
  final String? description;
  final String name;

  final int id;
  final controller = Get.find<CourseDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(16.r),
          child: Text(
            "اختر الدقة المناسبة:",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: kDarkBlueColor),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: response.link.length,
              itemBuilder: (item, index) => QualityButton(
                  onPressed: () {
                    Get.back();
                    print(response.link[index].link);
                    Get.to(
                      () => ShowCourseVideo(
                        description: description,
                        name: name,
                      ),
                      arguments: response.link[index].link,
                    );
                    controller.isWatched(id);
                  },
                  quality: response.link[index].rendition)),
        ),
      ]),
    );
  }
}
