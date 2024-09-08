import "dart:io";
import "package:hog/common/utils/utils.dart";
import 'package:http/http.dart' as http;
import "package:get/get.dart";
import "package:hog/common/constants/enums/request_enum.dart";
import "package:hog/data/repositories/category_repo.dart";
import "package:path_provider/path_provider.dart";
import "package:video_player/video_player.dart";

class ShowLessonController extends GetxController {
  @override
  void onInit() {
    String link = Get.arguments;
    watchVideo(link);
    super.onInit();
  }

  final CategoryRepository _categoryRepository = CategoryRepository();
  VideoPlayerController? videoPlayerController;
  var watchVideoStatus = RequestStatus.begin.obs;
  updateWatchVideoStatus(RequestStatus status) =>
      watchVideoStatus.value = status;

  Future<void> watchVideo(String link) async {
    updateWatchVideoStatus(RequestStatus.loading);
    // var response = await _categoryRepository.watchVideo(link);
    // if (response.success) {
    //   print(response.data);
    //   // print(response.data['link'].first['link']);
    try {
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(link));
      await videoPlayerController?.initialize();
      updateWatchVideoStatus(RequestStatus.success);
    } catch (e) {
      updateWatchVideoStatus(RequestStatus.onError);
    }
  }

  Future<void> downloadVideo(String link) async {
    var response = await _categoryRepository.downloadVideo(link);
    if (response.success) {
      print(" heelp from success");
      final url =
          'https://player.vimeo.com/progressive_redirect/download/917973997/container/8ecdc693-5215-4a55-8250-373853c595cd/23d9fcf0-4d844c91/%D9%85%D8%AD%D8%A7%D8%B3%D8%A8%D8%A91_-_%D8%A7%D9%84%D8%AF%D8%B1%D8%B3_%D8%A7%D9%84%D8%A3%D9%88%D9%84_-_%D8%A7%D9%84%D9%81%D9%8A%D8%AF%D9%8A%D9%88_%D8%A7%D9%84%D8%A3%D9%88%D9%84_2024%20%28240p%29.mp4?expires=1709544109&loc=external&oauth2_token_id=1760213992&session_id=8edd6af03d02df61b087df4ac162d1c20f6203641709457589&signature=cc9c7f73acc60727738fabf895c784042d9d652bd05ede51da2f40c75f4b25cc';
      var request = http.MultipartRequest('GET', Uri.parse(url));
      var response = await request.send();
      if (response.statusCode == 200) {
        final documentsDirectory = await getApplicationDocumentsDirectory();
        final file = File('${documentsDirectory.path}/video.mp4');
        var bytes = <int>[];
        response.stream.listen((newBytes) {
          print(newBytes);
          bytes.addAll(newBytes);
        }, onDone: () async {
          Utils.logPrint(bytes);
          print("DONE ************");
          await file.writeAsBytes(bytes);
          watchthevideo(file);
          // print(file.path);
        });
      } else {
        print(response.statusCode);
      }
    }
  }

  watchthevideo(File file) {
    videoPlayerController = VideoPlayerController.file(file)..initialize();
    updateWatchVideoStatus(RequestStatus.success);
  }

  @override
  void onClose() {
    print("*******************");
    videoPlayerController?.dispose();
    super.onClose();
  }
}
