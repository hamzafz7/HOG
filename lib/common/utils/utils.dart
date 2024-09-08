import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:hog/common/constants/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Utils {
  static void logPrint(Object? object) async {
    int defaultPrintLength = 1020;
    if (object == null || object.toString().length <= defaultPrintLength) {
    } else {
      String log = object.toString();
      int endIndex = defaultPrintLength;
      int logLength = log.length;
      int tmpLogLength = log.length;
      while (endIndex < logLength) {
        endIndex += defaultPrintLength;
        tmpLogLength -= defaultPrintLength;
      }
      if (tmpLogLength > 0) {}
    }
  }

  static bool isUrl(String text) {
    final isUrl = Uri.tryParse(text);
    return isUrl != null;
  }

  static String dateFormat(DateTime date, {String expression = "yyyy/MM/dd"}) {
    return DateFormat(expression).format(date);
  }

  static String timeFormat(DateTime date) {
    return DateFormat.jm().format(date);
  }

  static String formatTime(DateTime dateTime) {
    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    String second = dateTime.second.toString().padLeft(2, '0');

    return '$hour:$minute:$second';
  }

  static String formatDateForReasonScreen(DateTime date) {
    DateTime dateTime = date;
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }

  static String formatFullDate(String fullDate) {
    final inputFormat = DateFormat(
        'yyyy-MM-ddTHH:mm:ss.SSSSSSZ'); // Adjust the format based on your input
    final outputFormat = DateFormat('dd-MM-yyyy - HH:ss a');
    final date = inputFormat.parse(fullDate);
    return outputFormat.format(date);
  }

  static String maskEmail(String email) {
    final parts = email.split('@');
    final username = parts[0];
    final domain = parts[1];

    final maskedUsername =
        '${username.substring(0, 2)}${'*' * (username.length - 2)}';

    return '$maskedUsername@$domain';
  }

  // static void viewImage({required String? path, required bool isNetwork}) {
  //   if (path != null) {
  //     String safePath = path;
  //     Get.to(
  //       () => PhotoViewWidget(
  //         imagePath: safePath,
  //         isNetworkImage: isNetwork,
  //       ),
  //     );
  //   } else {
  //     Get.snackbar("fail_photo".tr, "fail_photo_view".tr);
  //   }
  // }

  // static void viewFile({required String? path, required bool isNetwork}) {
  //   if (path != null && path != "") {
  //     if (path.contains(".pdf")) {
  //       Get.to(
  //         () => FileViewWidget(imagePath: path),
  //       );
  //     } else {
  //       viewImage(path: path, isNetwork: isNetwork);
  //     }
  //   } else {
  //     Get.snackbar("fail_photo".tr, "fail_photo_view".tr);
  //   }
  // }

  // static Future<String?> pickfilefrommemory() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     allowedExtensions: ['pdf', 'png', 'jpg', 'jfif', 'HEIC'],
  //     type: FileType.custom,
  //   );
  //   if (result != null) {
  //     final file = result.files.first;
  //     String biographyfile = file.path!;
  //     return biographyfile;
  //   }
  //   return null;
  // }

  // static bool isValidDateFormat(String input) {
  //   try {
  //     DateTime.parse(input);
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  // static String? isEmailOptValidated(String? val) {
  //   if (val == null || val.isEmpty) {
  //     return null;
  //   } else if (!GetUtils.isEmail(val)) {
  //     return "invalid_email".tr;
  //   } else {
  //     return null;
  //   }
  // }

  static String? isPasswordValidated(String? val) {
    if (val == null || val.isEmpty) {
      return "يرجى إدخال كلمة المرور";
    } else if (val.length < 8 || val.length > 24) {
      return "يرجى إجمال الكلمة من 8 إلى 24 محرف";
    } else {
      return null;
    }
  }

  static String? isFeildValidated(String? val) {
    if (val == null || val.isEmpty) {
      return "هذا الحقل إجباري".tr;
    } else {
      return null;
    }
  }

  static String? isNumericFeildValidated(String? val) {
    if (val == null || val.isEmpty) {
      return "هذا الحقل إجباري";
    }
    try {
      double.parse(val);
      return null;
    } catch (e) {
      return "الرجاء إدخال أرقام فقط في هذا الحقل";
    }
  }

  static String? isNumericFeild(String? val) {
    if (val == null || val.isEmpty) {
      return null;
    }
    try {
      double.parse(val);
      return null;
    } catch (e) {
      return "Only Numbers are allowed in this feild".tr;
    }
  }

  CircularProgressIndicator getCircularProgress() {
    return const CircularProgressIndicator(color: kprimaryBlueColor);
  }

  static String? isEmailValidated(String? val) {
    if (val == null || val.isEmpty) {
      return "يرجى إدخال البريد الإلكتروني";
    } else if (!GetUtils.isEmail(val)) {
      return "هذا الإيميل غير صالح";
    } else {
      return null;
    }
  }

  List getSalaryDate(String stringDate) {
    DateTime date = DateFormat("yyyy-MM-dd").parse(stringDate);

    String year = DateFormat("yyyy").format(date);
    String month = DateFormat("MMMM").format(date);

    return [year, month];
  }

  String getDayofWeek(String stringDate) {
    try {
      DateTime date = DateFormat("yyyy-MM-dd").parse(stringDate);

      String dayOfWeek = DateFormat("EEEE").format(date);

      return dayOfWeek;
    } catch (e) {
      return "No day";
    }
  }

  getDayNum(String stringDate) {
    try {
      DateTime date = DateTime.parse(stringDate);

      int day = date.day;

      return day;
    } catch (_) {
      return 0;
    }
  }

  getYearOfDate(String dateString) {
    try {
      DateTime date = DateFormat("yyyy-MM-dd").parse(dateString);

      String year = DateFormat("yyyy").format(date);
      return year;
    } catch (_) {
      return "No Year";
    }
  }

  getMonthName(String dateString) {
    try {
      DateTime date = DateFormat("yyyy-MM-dd").parse(dateString);

      String month = DateFormat("MMMM").format(date);

      return month.substring(0, 3).toUpperCase();
    } catch (_) {
      return "No month";
    }
  }

  static isPhoneValidated(String? val) {
    if (val == null || val.isEmpty) {
      return " الهاتف المحمول حقل إجباري";
    } else if (val.length < 10 || val.length > 10) {
      return "الهاتف المحمول يجب أن يكون من 10 أرقام ";
    } else {
      return null;
    }
  }

  static Future<String?> imagePicker(ImageSource imageSource) async {
    final pickedImage = await ImagePicker().pickImage(source: imageSource);
    if (pickedImage != null) {
      return pickedImage.path;
    } else {
      return null;
    }
  }

  static Future<File?> compressImage(File file) async {
    try {
      final filePath = file.path;
      final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
      final splitted = filePath.substring(0, (lastIndex));
      final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
      var result = await FlutterImageCompress.compressAndGetFile(
        file.absolute.path,
        outPath,
        quality: 88,
      );

      return File(result!.path);
    } on CompressError {
      rethrow;
    }
  }
}
