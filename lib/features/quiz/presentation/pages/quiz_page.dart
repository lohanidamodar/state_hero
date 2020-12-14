import 'package:flutter/material.dart';
import 'package:state_hero/core/res/routes.dart';
import 'package:state_hero/features/quiz/data/models/question.dart';
import 'package:state_hero/features/quiz/presentation/notifiers/quiz_state.dart';
import 'package:state_hero/features/quiz/presentation/widgets/quiz_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_hero/features/quiz/presentation/widgets/quiz_options_dialog.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  int total;
  @override
  void initState() {
    super.initState();
    context.read(quizStateProvider).correctCount = 0;
    total = context.read(quizStateProvider).questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final quizState = watch(quizStateProvider);

        if (quizState.questions == null)
          return Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        if (quizState.questions.isEmpty)
          return Material(
            child: Text(
                "Sorry there are no questions in the set. \nPlease come back again soon."),
          );
        Question question;
        if (quizState.questions.isNotEmpty) {
          question = quizState.questions[_currentIndex];
        }
        final List<String> options = question?.options;
        if (quizState.answers[question.id] == null) {
          options.shuffle();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(quizState.category.title),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LinearProgressIndicator(
                value: (_currentIndex + 1) / quizState.questions.length,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(text: "Question "),
                          TextSpan(
                            text:
                                "${_currentIndex + 1}/${quizState.questions.length}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              QuizItem(
                question: question,
                options: options,
                answer: quizState.answers[question.id],
                onSelectAnswer: (answer) {
                  setState(() {
                    if (question.answer == answer) {
                      setState(() {
                        quizState.correctCount++;
                      });
                    }
                    quizState.answers[question.id] = answer;
                  });
                },
                questionNumber: _currentIndex + 1,
                showAnswer: watch(practiceModeProvider).state,
              ),
              const SizedBox(height: 10.0),
            ],
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            height: 80.0,
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(width: 10.0),
                  Text(_currentIndex == (quizState.questions.length - 1)
                      ? !watch(practiceModeProvider).state
                          ? "Submit"
                          : "Finish"
                      : "Next"),
                  const SizedBox(width: 10.0),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 16.0,
                  )
                ],
              ),
              onPressed: !watch(practiceModeProvider).state
                  ? () => _nextFinish(quizState)
                  : quizState.answers[question.id] != null
                      ? () => _nextFinish(quizState)
                      : null,
            ),
          ),
        );
      },
    );
  }

  void _nextFinish(QuizState quizState) async {
    if (_currentIndex < (quizState.questions.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      _finishQuiz();
    }
  }

  _finishQuiz() async {
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.quizSummary,
    );
  }
}
