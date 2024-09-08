import 'package:hog/data/models/question_model.dart';

class QuizzModel {
  String? title;
  String? description;
  List<QuestionModel>? questions;
  int? isFree;
  QuizzModel({this.description, this.questions, this.title});
  QuizzModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    isFree = json['is_free'];
    questions = json['questions'] != null
        ? List<QuestionModel>.from(
            json['questions']?.map((e) => QuestionModel.fromJson(e)))
        : [];
  }
}
