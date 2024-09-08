import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/common/constants/enums/request_enum.dart';
import 'package:hog/presentation/course_details/controller/downloaded_course_controller.dart';
import 'package:hog/presentation/course_details/widgets/flick_video_speed_widget.dart';

class ShowDownloadedVideo extends GetView<downloadedVideoController> {
  ShowDownloadedVideo({super.key, this.description});
  final String? description;

  // final controller = Get.isRegistered<downloadedVideoController>()
  //     ? Get.find<downloadedVideoController>()
  //     : Get.put(downloadedVideoController());

  // @override
  @override
  Widget build(BuildContext context) {
    Get.put(downloadedVideoController());
    return SafeArea(
      child: Scaffold(
          body: Obx(
        () => controller.watchVideoStatus.value == RequestStatus.success
            ? SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1 / 0.6,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            FlickVideoPlayer(
                              flickManager: FlickManager(
                                  autoPlay: false,
                                  videoPlayerController:
                                      controller.videoPlayerController!),
                              flickVideoWithControls:
                                  const FlickVideoWithControls(
                                controls: FlickPortraitControls(),
                              ),
                              flickVideoWithControlsFullscreen:
                                  FlickVideoWithControls(
                                videoFit: BoxFit.contain,
                                controls: Container(
                                  child: Stack(
                                    children: [
                                      FlickVideoSpeedControlWidget(
                                          flickManager: FlickManager(
                                              videoPlayerController: controller
                                                  .videoPlayerController!)),
                                      Align(
                                        alignment: AlignmentDirectional.topEnd,
                                        child: const FlickLandscapeControls(),
                                      ),
                                    ],
                                  ),
                                ),
                                playerLoadingFallback:
                                    Center(child: CircularProgressIndicator()),
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
                                        videoPlayerController: controller
                                            .videoPlayerController!))),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12.0.r),
                                child: Text("اسم الفيديو :",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(color: kprimaryGreyColor)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0.w, vertical: 8.h),
                                child: Text(controller.video?.videoName ??
                                    "لا يوجد اسم"),
                              ),
                              if (controller.video?.description != null &&
                                  controller.video!.description != "")
                                Padding(
                                  padding: EdgeInsets.all(12.0.r),
                                  child: Text("الوصف الخاص في هذا الدرس:",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(color: kprimaryGreyColor)),
                                ),
                              if (controller.video?.description != null &&
                                  controller.video!.description != "")
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0.w, vertical: 8.h),
                                  child: Text(controller.video!.description!),
                                ),
                            ],
                          ),
                        ],
                      )
                    ]),
              )
            : controller.watchVideoStatus.value == RequestStatus.loading
                ? Center(
                    child:
                        Center(child: Text("جاري تحميل الفيديو الخاص بك ..")),
                  )
                : Center(child: Text("حدث خطأ ما أثناء تحميل الفيديو")),
      )),
    );
  }
}
