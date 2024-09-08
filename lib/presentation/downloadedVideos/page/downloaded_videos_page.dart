import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:hog/common/constants/enums/request_enum.dart';
import 'package:hog/presentation/downloadedVideos/controller/downloaded_video_controller.dart';

class DownloadedVideosPage extends GetView<DownloadedVideosController> {
  const DownloadedVideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DownloadedVideosController());
    return Scaffold(
        body: Obx(() => switch (controller.getDownloadedVideosStatus.value) {
              RequestStatus.success => ListView.builder(
                  itemCount: controller.downloadedVideos.length,
                  itemBuilder: (context, index) => Container()),
              RequestStatus.begin => SizedBox.shrink(),
              RequestStatus.loading => Center(
                  child: CircularProgressIndicator(
                    color: kprimaryBlueColor,
                  ),
                ),
              RequestStatus.onError =>
                Center(child: Text("حدث خطأ في عرض الفيديوهات")),
              RequestStatus.noData =>
                Center(child: Text("لا توجد فيديوهات محملة لهذا الكورس")),
              RequestStatus.noInternentt => SizedBox.shrink(),
            }));
  }
}
