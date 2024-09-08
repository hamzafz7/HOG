class ValueOfCourse {
  final int id;
  final int courseId;
  final String value;
  final DateTime createdAt;
  final DateTime updatedAt;

  ValueOfCourse({
    required this.id,
    required this.courseId,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ValueOfCourse.fromJson(Map<String, dynamic> json) {
    return ValueOfCourse(
      id: json['id'],
      courseId: json['course_id'],
      value: json['value'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
