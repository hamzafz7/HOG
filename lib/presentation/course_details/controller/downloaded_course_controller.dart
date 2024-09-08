import 'dart:io';
import 'dart:typed_data';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/enums/request_enum.dart';
import 'package:hog/data/models/video_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/block/aes_fast.dart';
import 'package:pointycastle/stream/ctr.dart';
import 'package:video_player/video_player.dart';

class downloadedVideoController extends GetxController {
  Video? video;
  @override
  void onInit() {
    video = Get.arguments;
    print(video!.description);
    if (video != null) watchVideo();
    super.onInit();
  }

  var watchVideoStatus = RequestStatus.begin.obs;
  updateWatchVideoStatus(RequestStatus status) =>
      watchVideoStatus.value = status;
  VideoPlayerController? videoPlayerController;
  FlickManager? flickManager;
  final _secureStorage = const FlutterSecureStorage();

  Future<File> decryptFile(File file, String key) async {
    final encryptedText = await file.readAsBytes();
    print(file.path);
    final keyBytes = Uint8List.fromList(key.codeUnits);
    final iv = Uint8List(16);
    final cipher = CTRStreamCipher(AESFastEngine())
      ..init(
        false,
        ParametersWithIV(
          KeyParameter(keyBytes),
          iv,
        ),
      );

    final decryptedBytes = cipher.process(encryptedText);

    final directory = await getTemporaryDirectory();
    final tempFilePath = '${directory.path}/temp.mp4';
    File tempFile = File(tempFilePath);
    await tempFile.writeAsBytes(decryptedBytes);

    return tempFile;
  }

  Future<void> watchVideo() async {
    updateWatchVideoStatus(RequestStatus.loading);
    await Future.delayed(Duration(seconds: 2));
    if (video != null) {
      try {
        final key = 'video_${video?.courseName}-${video?.videoName}';
        final path = await _secureStorage.read(key: key);

        File file = File(path!);
        File tempFile =
            await decryptFile(file, 'u8x/A?D(G+KbPeShVmYq3t6w9z/C&F)J');
        print("zzzzz");
        videoPlayerController = await VideoPlayerController.file(tempFile)
          ..initialize();
        updateWatchVideoStatus(RequestStatus.success);
      } catch (e) {
        print(e.toString());
        updateWatchVideoStatus(RequestStatus.onError);
      }
    } else {
      updateWatchVideoStatus(RequestStatus.onError);
    }
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    super.onClose();
  }
}
