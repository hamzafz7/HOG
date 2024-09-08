class QuestionQuiz {
  final int id;
  final int isVisible;

  QuestionQuiz({
    required this.id,
    required this.isVisible,
  });

  factory QuestionQuiz.fromJson(Map<String, dynamic> json) {
    return QuestionQuiz(
      id: json['id'],
      isVisible: json['is_visible'],
    );
  }
}
