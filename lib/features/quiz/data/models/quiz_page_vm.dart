import 'package:state_hero/features/quiz/data/models/category.dart';
import 'package:state_hero/features/quiz/data/models/question.dart';

class QuizPageViewModel {
  final Category category;
  final List<Question> questions;
  final bool practiceMode;

  QuizPageViewModel({this.category, this.questions,this.practiceMode});
}
