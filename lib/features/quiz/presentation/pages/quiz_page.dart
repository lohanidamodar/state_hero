import 'package:flutter/material.dart';
import 'package:state_hero/features/quiz/data/models/question.dart';
import 'package:state_hero/features/quiz/data/models/quiz_page_vm.dart';
import 'package:state_hero/features/quiz/presentation/widgets/quiz_item.dart';

class QuizPage extends StatefulWidget {
  final QuizPageViewModel vm;

  const QuizPage({Key key, this.vm}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  bool _correct;
  int _correctCount;
  int total;
  final Map<String, dynamic> _answers = {};
  @override
  void initState() {
    super.initState();
    _correctCount = 0;
    total = widget.vm.questions.length;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.vm.questions == null)
      return Material(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    if (widget.vm.questions.isEmpty)
      return Material(
        child: Text(
            "Sorry there are no questions in the set. \nPlease come back again soon."),
      );
    Question question;
    if (widget.vm.questions.isNotEmpty) {
      question = widget.vm.questions[_currentIndex];
    }
    final List<String> options = question?.options;
    if (_answers[question.id] == null) {
      options.shuffle();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.vm.category.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LinearProgressIndicator(
            value: (_currentIndex + 1) / widget.vm.questions.length,
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
                            "${_currentIndex + 1}/${widget.vm.questions.length}",
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
            answer: _answers[question.id],
            onSelectAnswer: (answer) {
              setState(() {
                if (question.answer == answer) {
                  _correct = true;
                  setState(() {
                    _correctCount++;
                  });
                } else {
                  _correct = false;
                }
                _answers[question.id] = answer;
              });
            },
            questionNumber: _currentIndex + 1,
            showAnswer: widget.vm.practiceMode,
          ),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(width: 10.0),
                RaisedButton(
                  elevation: 0,
                  key: Key("next_button"),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(_currentIndex == (widget.vm.questions.length - 1)
                          ? !widget.vm.practiceMode
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
                  onPressed: !widget.vm.practiceMode
                      ? _nextFinish
                      : _answers[question.id] != null
                          ? _nextFinish
                          : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _nextFinish() async {
    if (_currentIndex < (widget.vm.questions.length - 1)) {
      setState(() {
        _currentIndex++;
        _correct = null;
      });
    } else {
      _finishQuiz();
    }
  }

  _finishQuiz() async {}
}
