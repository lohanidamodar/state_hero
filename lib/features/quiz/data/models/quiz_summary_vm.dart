import 'package:state_hero/features/quiz/data/models/category.dart';
import 'package:state_hero/features/quiz/data/models/question.dart';

class QuizSummaryVm {
  final Category category;
  final List<Question> questions;
  final int correctCount;
  final Map<String,dynamic> answers;
  QuizSummaryVm({this.category, this.questions, this.correctCount,this.answers});
}
