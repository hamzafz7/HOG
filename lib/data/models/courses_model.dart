class CoursesModel {
  List<CourseModel>? courses;
  String? message;

  CoursesModel({required this.courses, required this.message});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    courses = json['data'] != null
        ? List<CourseModel>.from(
            json['data'].map((e) => CourseModel.fromJson(e)))
        : null;
  }
}

class CourseModel {
  final int id;
  final String? name;
  final String? image;
  final String? telegramChannelLink;
  final bool? isOpen;
  List<String>? teachers;
  bool? isTeachWithCourse;
  final bool? isVisible;
  final bool? isPaid;

  CourseModel({
    required this.id,
    required this.name,
    required this.image,
    required this.telegramChannelLink,
    required this.isOpen,
    required this.isVisible,
    this.teachers,
    this.isTeachWithCourse,
    required this.isPaid,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        telegramChannelLink: json['telegram_channel_link'],
        isOpen: json['is_open'],
        isVisible: json['is_visible'],
        isPaid: json['is_paid'],
        isTeachWithCourse: json['is_teach_this_course'],
        teachers: json['teachers'] != null
            ? List<String>.from(json['teachers'])
            : []);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'telegram_channel_link': telegramChannelLink,
      'is_open': isOpen == true ? 1 : 0,
      'is_visible': isVisible == true ? 1 : 0,
      'is_paid': isPaid == true ? 1 : 0,
    };
  }

  // Convert Map from SQLite to CourseModel
  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      telegramChannelLink: map['telegram_channel_link'],
      isOpen: map['is_open'] == 1,
      isVisible: map['is_visible'] == 1,
      isPaid: map['is_paid'] == 1,
      teachers: [], // SQLite doesn't directly store lists, so handle accordingly
    );
  }
}
