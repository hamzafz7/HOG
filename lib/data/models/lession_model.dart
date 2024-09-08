class LessionModel {
  final int id;
  final String? title;
  final String? link;
  final int? time;
  final bool? isVisible;
  final bool? isOpen;
  final String? type;
  final bool? isWatched;
  final int? chapterId;
  final String? description;

  // final DateTime? createdAt;
  // final DateTime? updatedAt;

  LessionModel(
      {required this.id,
      required this.title,
      required this.link,
      required this.time,
      required this.isVisible,
      required this.isOpen,
      this.description,
      required this.type,
      required this.chapterId,
      required this.isWatched
      // required this.createdAt,
      // required this.updatedAt,
      });

  factory LessionModel.fromJson(Map<String, dynamic> json) {
    return LessionModel(
        id: json['id'],
        title: json['title'],
        link: json['link'],
        time: json['time'],
        isVisible: json['is_visible'],
        isOpen: json['is_open'],
        type: json['type'],
        chapterId: json['chapter_id'],
        description: json['description'],
        isWatched: json['is_watched']
        // createdAt: DateTime.parse(json['created_at']),
        // updatedAt: DateTime.parse(json['updated_at']),
        );
  }
}
