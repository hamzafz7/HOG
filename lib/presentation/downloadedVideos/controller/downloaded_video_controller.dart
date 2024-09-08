import 'package:get/get.dart';
import 'package:hog/common/constants/enums/request_enum.dart';
import 'package:hog/data/models/courses_model.dart';
import 'package:hog/data/models/video_model.dart';
import 'package:hog/data/providers/databaseProvider/video_database.dart';

class DownloadedVideosController extends GetxController {
  CourseModel? model;

  @override
  void onInit() {
    model = Get.arguments;
    getDownloadedVideos();
    super.onInit();
  }

  RxList<Video> downloadedVideos = <Video>[].obs;

  var getDownloadedVideosStatus = RequestStatus.begin.obs;

  updateGetDownloadedVideosStatus(RequestStatus state) =>
      getDownloadedVideosStatus.value = state;

  Future getDownloadedVideos() async {
    updateGetDownloadedVideosStatus(RequestStatus.loading);
    downloadedVideos.clear();
    try {
      downloadedVideos.value =
          await VideoDatabase.getVideosByCourseName(model?.name ?? "none") ??
              [];
      if (downloadedVideos.isEmpty) {
        updateGetDownloadedVideosStatus(RequestStatus.noData);
      } else {
        updateGetDownloadedVideosStatus(RequestStatus.success);
      }
    } catch (e) {
      updateGetDownloadedVideosStatus(RequestStatus.onError);
    }
  }
}
