import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hog/presentation/course_details/controller/course_details_controller.dart';
import 'package:hog/presentation/course_details/widgets/downloaded_video_widget.dart';

class DownloadedVideosWidget extends StatelessWidget {
  DownloadedVideosWidget({super.key});
  final controller = Get.find<CourseDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.downloadedVideos.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.downloadedVideos.length,
            itemBuilder: (context, index) => DownloadedVideoWidget(
                video: controller.downloadedVideos[index]))
        : Center(
            child: Container(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "لا يوجد أي دروس محفوظة",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  )),
            ),
          ));
  }
}
