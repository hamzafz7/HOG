import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/data/models/download_model.dart';
import 'package:hog/presentation/course_details/controller/course_details_controller.dart';
import 'package:hog/presentation/widgets/quality_button.dart';

class PickQualityDialog extends StatelessWidget {
  PickQualityDialog(
      {super.key,
      required this.response,
      required this.videoName,
      required this.courseName,
      required this.description,
      required this.videoId});
  final DownloadResponse response;
  final String videoName;
  final String? description;
  final int videoId;
  final String courseName;
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
              itemCount: response.downloadOptions.length,
              itemBuilder: (item, index) => QualityButton(
                  onPressed: () {
                    controller.saveAndDownload(
                        url: response.downloadOptions[index].link!,
                        courseName: courseName,
                        courseVidName: videoName,
                        videoId: videoId,
                        description: description);
                    Get.back();
                  },
                  quality: response.downloadOptions[index].quality!)),
        ),
      ]),
    );
  }
}
