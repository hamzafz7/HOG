import 'package:hog/data/models/choice_model.dart';
import 'package:hog/data/models/question_quiz.dart';

class QuestionModel {
  int? id;
  String? title;
  String? image;
  String? clarificationImage;
  String? clarificationText;
  List<ChoiceModel>? choices;
  QuestionQuiz? questionQuiz;
  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    clarificationImage = json['clarification_image'];
    clarificationText = json['clarification_text'];
    choices = json['choices'] != null
        ? List<ChoiceModel>.from(
            json['choices'].map((e) => ChoiceModel.fromJson(e)))
        : [];
    questionQuiz = QuestionQuiz.fromJson(json['questionQuiz']);
  }
}
