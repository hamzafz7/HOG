import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/data/models/video_model.dart';
import 'package:hog/presentation/course_details/controller/course_details_controller.dart';
import 'package:hog/presentation/course_details/widgets/show_downloaded_video.dart';
import 'package:svg_flutter/svg.dart';

class DownloadedVideoWidget extends StatelessWidget {
  DownloadedVideoWidget({super.key, required this.video});
  final Video video;
  final controller = Get.find<CourseDetailsController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Container(
        width: Get.width,
        child: GestureDetector(
          onTap: () {
            Get.to(() => ShowDownloadedVideo(), arguments: video);
          },
          child: Row(children: [
            SvgPicture.asset('assets/icons/play-circle.svg'),
            SizedBox(
              width: 20.w,
            ),
            SizedBox(
              width: 200.w,
              child: Text(
                video.videoName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 8),
            IconButton(
                onPressed: () {
                  controller.deleteVideo(video.courseName, video.videoName);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ))
          ]),
        ),
      ),
    );
  }
}
