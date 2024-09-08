import 'package:hog/data/models/lession_model.dart';
import 'package:hog/data/models/quiz_model.dart';

class ChapterModel {
  int? id;
  String? name;
  bool? isVisible;
  List<LessionModel>? lessons;
  List<QuizzModel>? quizzes;

  ChapterModel.formJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    isVisible = map['is_visible'];
    lessons = map['lesions'] != null
        ? List<LessionModel>.from(
            map['lesions'].map((e) => LessionModel.fromJson(e)))
        : null;
    quizzes = map['quizzes'] != null
        ? List<QuizzModel>.from(
            map['quizzes'].map((e) => QuizzModel.fromJson(e)))
        : [];
  }
}
