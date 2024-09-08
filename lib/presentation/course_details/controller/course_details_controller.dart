import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hog/presentation/custom_dialogs/pick_quality_dialog.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/block/aes_fast.dart';
import 'package:pointycastle/stream/ctr.dart';
import 'package:hog/common/constants/enums/request_enum.dart';
import 'package:hog/common/utils/utils.dart';
import 'package:hog/data/models/course_info_model.dart';
import 'package:hog/data/models/courses_model.dart';
import 'package:hog/data/models/download_model.dart';
import 'package:hog/data/models/video_link_response.dart';
import 'package:hog/data/models/video_model.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';
import 'package:hog/data/providers/databaseProvider/video_database.dart';
import 'package:hog/data/repositories/category_repo.dart';
import 'package:hog/presentation/custom_dialogs/custom_dialogs.dart';
import 'package:hog/presentation/custom_dialogs/pick_quality_from_url.dart';
import 'package:hog/presentation/my_courses/controllers/my_courses_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class CourseDetailsController extends GetxController {
  @override
  void onInit() {
    _courseModel = Get.arguments;
    getCourseInfo(_courseModel!.id).then((value) {
      getDownloadedVideos();
    });
    super.onInit();
  }

  RxInt currentTabIndex = 0.obs;
  void updateCurrentTabIndex(int index) {
    currentTabIndex.value = index;
  }

  RxInt currentWidgetIndex = 0.obs;
  changeCurrentWidgetIndx(int val) {
    currentWidgetIndex.value = val;
  }

  RxList<Video> downloadedVideos = <Video>[].obs;

  Future<void> getDownloadedVideos() async {
    downloadedVideos.clear();
    downloadedVideos.value = await VideoDatabase.getVideosByCourseName(
            courseInfoModel!.course!.name ?? "none") ??
        [];
    if (downloadedVideos.isEmpty) {
      print(courseInfoModel!.course!.name);
    } else {
      print(downloadedVideos);
    }
    update();
  }

  bool isVideoDownloaded(String videoName) {
    bool isDownloaded = false;
    downloadedVideos.forEach((element) {
      print(element.videoName);
      print(videoName);
      if (element.videoName == videoName) {
        isDownloaded = true;
      }
    });
    return isDownloaded;
  }

  VideoLinksResponse? watchResponse;

  Future<void> watchResponseFromUrl(
    BuildContext context, {
    required String link,
    required int id,
    String? description,
    required String name,
  }) async {
    var response = await _categoryRepository.watchVideo(link);
    if (response.success) {
      watchResponse = VideoLinksResponse.fromJson(response.data);
      CustomDialog(context,
          child: PickQualityFromUrl(
            response: watchResponse!,
            id: id,
            description: description,
            name: name,
          ));
    }
  }

  TextEditingController activationController = TextEditingController();
  var courseDetailFormKey = GlobalKey<FormState>();

  CourseModel? _courseModel;
  CourseInfoResponse? courseInfoModel;

  var getCourseInfoStatus = RequestStatus.begin.obs;
  var signInCourseStatus = RequestStatus.begin.obs;

  final CategoryRepository _categoryRepository = CategoryRepository();

  void updateGetCourseInfo(RequestStatus status) =>
      getCourseInfoStatus.value = status;

  void updateSignInCourseStatus(RequestStatus status) =>
      signInCourseStatus.value = status;

  Future<void> signInCourse(int id, String activationCode) async {
    updateSignInCourseStatus(RequestStatus.loading);
    var response = await _categoryRepository.signInCourse(id, activationCode);
    if (response.success) {
      print(response.data);
      updateSignInCourseStatus(RequestStatus.success);
      Get.back();
      getCourseInfo(id);
      if (Get.isRegistered<MyCoursesController>()) {
        Get.find<MyCoursesController>().getMyCourses(CacheProvider.getUserId());
      } else {
        Get.put(MyCoursesController()).getMyCourses(CacheProvider.getUserId());
      }
    } else {
      print(response.errorMessage);
      Get.back();
      Get.snackbar("حدث خطأ", response.errorMessage!);
      updateSignInCourseStatus(RequestStatus.onError);
    }
  }

  Future<void> getCourseInfo(int id) async {
    updateGetCourseInfo(RequestStatus.loading);
    var response = await _categoryRepository.getCourseInfo(id);
    print("Response error message: ${response.errorMessage}");
    if (response.success) {
      print(response.data);
      courseInfoModel = CourseInfoResponse.fromJson(response.data);
      Utils.logPrint(response.data);
      if (courseInfoModel == null || courseInfoModel!.course == null) {
        updateGetCourseInfo(RequestStatus.noData);
      } else {
        updateGetCourseInfo(RequestStatus.success);
      }
    } else {
      if (response.errorMessage == "لا يوجد اتصال بالانترنت") {
        updateGetCourseInfo(RequestStatus.noInternentt);
      } else {
        updateGetCourseInfo(RequestStatus.onError);
      }
    }
  }

  void changeCurrentWidgetIndex(int val) {
    currentWidgetIndex.value = val;
  }

  void launchTelegramURL(String? url) async {
    if (url != null) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  DownloadResponse? downloadResponse;
  var downloadStatus = RequestStatus.begin.obs;

  void updateDownloadStatus(RequestStatus status) =>
      downloadStatus.value = status;

  RxList<int> currentDownloadedVidId = <int>[].obs;

  void updateCurrentId(int id) {
    currentDownloadedVidId.add(id);
  }

  final _secureStorage = const FlutterSecureStorage();

  Future<void> deleteVideo(String courseName, String courseVid) async {
    await VideoDatabase.deleteVideo(courseName, courseVid).then((value) {
      getDownloadedVideos();
    });
  }

  Future<void> isWatched(int lessonId) async {
    var response = await _categoryRepository.isWatched(lessonId);
    print(response.success);
  }

  // Download-related fields
  RxBool isDownloading = false.obs;
  RxInt downloaded = 0.obs;
  RxInt fileLength = 0.obs;
  RxBool isPaused = false.obs;
  RxBool isReconnecting = false.obs;
  StreamSubscription<List<int>>? _downloadSubscription;
  HttpClientRequest? _httpClientRequest;
  HttpClientResponse? _httpClientResponse;
  File? _file;
  String? _filePath;
  String? _url;
  String? _courseName;
  String? _courseVidName;
  int? _videoId;
  String? _description;
  Timer? _retryTimer;

  // Method to start downloading
  Future<void> startDownload({
    required String url,
    required String courseName,
    required String courseVidName,
    required int videoId,
    required String? description,
  }) async {
    _url = url;
    _courseName = courseName;
    _courseVidName = courseVidName;
    _videoId = videoId;
    _description = description;

    isDownloading.value = true;
    isPaused.value = false;
    isReconnecting.value = false;

    // Enable wakelock to keep the device awake during download
    WakelockPlus.enable();

    // Determine the file path
    Directory dir = await getExternalStorageDirectory() ??
        await getApplicationDocumentsDirectory();
    _filePath = "${dir.path}/$_courseName/$_courseVidName.mp4";
    _file = File(_filePath!);

    // Create directories if they don't exist
    _file!.parent.createSync(recursive: true);

    // Get already downloaded size if the file exists
    int downloadedSize = 0;
    if (_file!.existsSync()) {
      downloadedSize = await _file!.length();
    }
    downloaded.value = downloadedSize;

    await _downloadFile();
  }

  Future<void> _downloadFile() async {
    try {
      // Create request with range header for resuming if partially downloaded
      final HttpClient httpClient = HttpClient();
      _httpClientRequest = await httpClient.getUrl(Uri.parse(_url!));
      _httpClientRequest!.headers.set('Range', 'bytes=${downloaded.value}-');

      _httpClientResponse = await _httpClientRequest!.close();

      // Calculate total file length
      fileLength.value =
          (_httpClientResponse!.contentLength ?? 0) + downloaded.value;

      // Open file stream
      final output = _file!.openWrite(
          mode: downloaded.value > 0 ? FileMode.append : FileMode.write);

      // Subscribe to the download stream
      _downloadSubscription = _httpClientResponse!.listen((data) {
        if (!isPaused.value) {
          Uint8List uint8List = Uint8List.fromList(data);
          final encryptedData =
              _encryptBytes(uint8List, 'u8x/A?D(G+KbPeShVmYq3t6w9z/C&F)J');
          output.add(encryptedData);
          downloaded.value += data.length;
          print("Downloaded: ${downloaded.value} / ${fileLength.value}");
        }
      });

      _downloadSubscription!.onDone(() async {
        await output.close();
        await _endDownload();
      });

      _downloadSubscription!.onError((error) {
        print("Download error: $error");
        _handleDownloadError();
      });
    } catch (e) {
      print("Failed to start download: $e");
      _handleDownloadError();
    }
  }

  void pauseDownload() {
    if (_downloadSubscription != null && !isPaused.value) {
      _downloadSubscription!.pause();
      isPaused.value = true;
      print("Download paused");
    }
  }

  void resumeDownload() {
    if (_downloadSubscription != null && isPaused.value) {
      _downloadSubscription!.resume();
      isPaused.value = false;
      print("Download resumed");
    }
  }

  void _handleDownloadError() {
    isReconnecting.value = true;
    _downloadSubscription?.cancel();

    // Retry mechanism with a delay
    _retryTimer?.cancel();
    _retryTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      if (!isPaused.value && !isDownloading.value) {
        print("Retrying download...");
        _retryDownload();
      }
    });

    print("Attempting to reconnect...");
  }

  void _retryDownload() {
    if (isReconnecting.value) {
      print("Reconnecting...");
      isReconnecting.value = false;
      _retryTimer?.cancel();
      _downloadFile(); // Retry the download attempt
    }
  }

  Future<void> _endDownload() async {
    isDownloading.value = false;
    WakelockPlus.disable();
    _downloadSubscription?.cancel();
    _retryTimer?.cancel();
    print("Download completed");

    // Save the path to secure storage and database
    final key = 'video_$_courseName-$_courseVidName';
    await _secureStorage.write(key: key, value: _filePath!);
    await VideoDatabase.insertVideo(
      courseName: _courseName!,
      videoName: _courseVidName!,
      key: key,
      videoId: _videoId!,
      description: _description,
    );

    // Update the download status and notify the user
    updateDownloadStatus(RequestStatus.success);
    getDownloadedVideos();
    Get.snackbar(
        "تم الأمر بنجاح", "نود بإعلامك أن هذا الفيديو أصبح من المحفوظات");
  }

  Uint8List _encryptBytes(Uint8List data, String key) {
    final keyBytes = Uint8List.fromList(key.codeUnits);
    final iv = Uint8List(16);
    final cipher = CTRStreamCipher(AESFastEngine())
      ..init(
        true,
        ParametersWithIV(
          KeyParameter(keyBytes),
          iv,
        ),
      );

    return cipher.process(data);
  }

  Future<void> saveAndDownload({
    required String url,
    required String courseName,
    required String courseVidName,
    required int videoId,
    required String? description,
  }) async {
    // Initiate the download process using the new download method
    await startDownload(
      url: url,
      courseName: courseName,
      courseVidName: courseVidName,
      videoId: videoId,
      description: description,
    );
  }

  Future<void> downloadVideo(
    String link,
    BuildContext context,
    String courseName,
    String videoName,
    int videoId,
    String? description,
  ) async {
    updateDownloadStatus(RequestStatus.loading);

    // Call the repository method to get the download link
    var response = await _categoryRepository.downloadVideo(link);
    if (response.success) {
      // Parse the response to get the download details
      downloadResponse = DownloadResponse.fromJson(response.data['link']);
      print("course video :$videoName");

      // Display the dialog to pick the quality of the video
      CustomDialog(
        context,
        child: PickQualityDialog(
          response: downloadResponse!,
          videoName: videoName,
          courseName: courseName,
          videoId: videoId,
          description: description,
        ),
      );

      updateDownloadStatus(RequestStatus.success);
    } else {
      // Handle error if the response is unsuccessful
      updateDownloadStatus(RequestStatus.onError);
    }
  }

  // Cleanup on disposal
  @override
  void onClose() {
    _downloadSubscription?.cancel();
    _retryTimer?.cancel();
    super.onClose();
  }
}
