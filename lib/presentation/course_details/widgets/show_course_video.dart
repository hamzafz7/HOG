import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/common/constants/enums/request_enum.dart';
import 'package:hog/presentation/course_details/controller/show_lesson_controller.dart';
import 'package:hog/presentation/course_details/widgets/flick_video_speed_widget.dart';

class ShowCourseVideo extends GetView<ShowLessonController> {
  const ShowCourseVideo({super.key, this.description, this.name});
  final String? description;
  final String? name;

  @override
  Widget build(BuildContext context) {
    Get.put(ShowLessonController());

    // Define the FlickProgressBarSettings to use in both portrait and landscape
    final progressBarSettings = FlickProgressBarSettings(
      playedColor: Colors.red,
      bufferedColor: Colors.grey,
      handleColor: Colors.red,
    );

    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.watchVideoStatus.value == RequestStatus.success
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          AspectRatio(
                            aspectRatio: 1 / 0.6,
                            child: Stack(
                              children: [
                                FlickVideoPlayer(
                                  flickManager: FlickManager(
                                      videoPlayerController:
                                          controller.videoPlayerController!),
                                  flickVideoWithControls:
                                      FlickVideoWithControls(
                                    controls: FlickPortraitControls(
                                      progressBarSettings: progressBarSettings,
                                    ),
                                  ),
                                  flickVideoWithControlsFullscreen:
                                      FlickVideoWithControls(
                                    videoFit: BoxFit.contain,
                                    controls: FlickPortraitControls(
                                      progressBarSettings: progressBarSettings,
                                    ),
                                    playerLoadingFallback: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    iconThemeData: IconThemeData(
                                        size: 30, color: Colors.white),
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                    backgroundColor: Colors.black,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: FlickVideoSpeedControlWidget(
                                    flickManager: FlickManager(
                                      videoPlayerController:
                                          controller.videoPlayerController!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 270.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(12.0.r),
                                    child: Text(
                                      "اسم الفيديو :",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(color: kprimaryGreyColor),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.0.w, vertical: 8.h),
                                    child: Text(name!),
                                  ),
                                  if (description != null &&
                                      description!.isNotEmpty)
                                    Padding(
                                      padding: EdgeInsets.all(12.0.r),
                                      child: Text(
                                        "الوصف الخاص في هذا الدرس:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(color: kprimaryGreyColor),
                                      ),
                                    ),
                                  if (description != null &&
                                      description!.isNotEmpty)
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0.w, vertical: 8.h),
                                      child: Text(description!),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : controller.watchVideoStatus.value == RequestStatus.loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(child: Text("حدث خطأ ما أثناء تحميل الفيديو")),
        ),
      ),
    );
  }
}
