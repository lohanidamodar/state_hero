import 'package:flutter/material.dart';
import 'package:state_hero/core/res/routes.dart';
import 'package:state_hero/features/quiz/data/models/category.dart';
import 'package:state_hero/features/quiz/data/models/question.dart';
import 'package:state_hero/features/quiz/data/models/quiz_page_vm.dart';

class QuizOptionsDialog extends StatefulWidget {
  final String title;
  const QuizOptionsDialog({Key key, this.title}) : super(key: key);

  @override
  _QuizOptionsDialogState createState() => _QuizOptionsDialogState();
}

class _QuizOptionsDialogState extends State<QuizOptionsDialog> {
  int _noOfQuestions;
  bool _practiceMode;
  bool _processing;

  @override
  void initState() {
    super.initState();
    _noOfQuestions = 10;
    _processing = false;
    _practiceMode = false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey.shade200,
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 10.0),
          Text("Select Total Number of Questions"),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 16.0,
              spacing: 16.0,
              children: <Widget>[
                SizedBox(width: 0.0),
                ActionChip(
                  label: Text("10"),
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: _noOfQuestions == 10
                      ? Colors.indigo
                      : Colors.grey.shade600,
                  onPressed: () => _selectNumberOfQuestions(10),
                ),
                ActionChip(
                  label: Text("20"),
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: _noOfQuestions == 20
                      ? Colors.indigo
                      : Colors.grey.shade600,
                  onPressed: () => _selectNumberOfQuestions(20),
                ),
                ActionChip(
                  label: Text("30"),
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: _noOfQuestions == 30
                      ? Colors.indigo
                      : Colors.grey.shade600,
                  onPressed: () => _selectNumberOfQuestions(30),
                ),
                ActionChip(
                  label: Text("40"),
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: _noOfQuestions == 40
                      ? Colors.indigo
                      : Colors.grey.shade600,
                  onPressed: () => _selectNumberOfQuestions(40),
                ),
                ActionChip(
                  label: Text("50"),
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: _noOfQuestions == 50
                      ? Colors.indigo
                      : Colors.grey.shade600,
                  onPressed: () => _selectNumberOfQuestions(50),
                ),
              ],
            ),
          ),
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: _practiceMode,
            title: Text("Practice Mode"),
            onChanged: (val) {
              setState(() {
                _practiceMode = val;
              });
            },
          ),
          SizedBox(height: 20.0),
          _processing
              ? CircularProgressIndicator()
              : ElevatedButton(
                  child: Text("Start Quiz"),
                  onPressed: _startQuiz,
                ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  _selectNumberOfQuestions(int i) {
    setState(() {
      _noOfQuestions = i;
    });
  }

  void _startQuiz() async {
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.quiz,
      arguments: QuizPageViewModel(
        practiceMode: _practiceMode,
        category: Category(id: "1", title: "General Knowledge"),
        questions: [
          Question(
              id: "1",
              question: "What is question?",
              options: ["1", "2", "3", "4"],
              answer: "2"),
          Question(
              id: "2",
              question: "What is question?",
              options: ["1", "2", "3", "4"],
              answer: "2"),
        ],
      ),
    );
  }
}
