import 'package:hog/data/models/chapter_model.dart';
import 'package:hog/data/models/value_of_course_modrel.dart';

class CourseInfoResponse {
  CourseInfoModel? course;
  CourseInfoResponse.fromJson(Map<String, dynamic> json) {
    course =
        json['data'] != null ? CourseInfoModel.fromJson(json['data']) : null;
  }
}

class CourseInfoModel {
  int? id;
  String? name;
  String? image;
  String? telegramChannelLink;
  bool? isOpen;
  bool? isVisible;
  bool? isPaid;
  int? totalTime;
  List<String>? teachers;
  List<ChapterModel>? chapters;
  List<ValueOfCourse>? valuesOfCourse;
  bool? isTeachWithCourse;
  String? message;
  CourseInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    telegramChannelLink = json['telegram_channel_link'];
    isOpen = json['is_open'];
    isVisible = json['is_visible'];
    isPaid = json['is_paid'];
    totalTime = json['total_time'];
    isTeachWithCourse = json['is_teach_this_course'];
    teachers =
        json['teachers'] != null ? List<String>.from(json['teachers']) : [];
    chapters = json['chapters'] != null
        ? List<ChapterModel>.from(
            json['chapters'].map((e) => ChapterModel.formJson(e)))
        : [];
    valuesOfCourse = json['values_of_course'] != null
        ? List<ValueOfCourse>.from(
            json['values_of_course'].map((e) => ValueOfCourse.fromJson(e)))
        : [];

    message = json['message'];
  }
}
