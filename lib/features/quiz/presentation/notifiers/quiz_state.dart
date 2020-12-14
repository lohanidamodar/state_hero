import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:state_hero/features/quiz/data/models/category.dart';
import 'package:state_hero/features/quiz/data/models/question.dart';

class QuizState extends ChangeNotifier {
  Category _category;
  List<Question> _questions;
  int _correctCount;
  Map<String, dynamic> _answers;

  QuizState() {
    _answers = {};
  }

  Category get category => _category;
  set category(Category category) {
    _category = category;
    notifyListeners();
  }

  List<Question> get questions => _questions;
  set questions(List<Question> questions) {
    _questions = questions;
    notifyListeners();
  }

  int get correctCount => _correctCount;
  set correctCount(int correctCount) {
    _correctCount = correctCount;
    notifyListeners();
  }

  Map<String, dynamic> get answers => _answers;
  set answers(Map<String, dynamic> answers) {
    _answers = answers;
    notifyListeners();
  }
}

final quizStateProvider = ChangeNotifierProvider((ref) => QuizState());
