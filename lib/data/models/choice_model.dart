class ChoiceModel {
  int? id;
  String? title;
  String? image;
  int? questionId;
  bool? isTrue;
  bool? isVisible;
  ChoiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    questionId = json['question_id'];
    isTrue = json['is_true'];
    isVisible = json['is_visible'];
  }
}
