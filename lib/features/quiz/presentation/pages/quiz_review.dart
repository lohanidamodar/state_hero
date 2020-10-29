import 'package:flutter/material.dart';
import 'package:state_hero/core/presentation/widgets/bordered_container.dart';
import 'package:state_hero/features/quiz/data/models/question.dart';
import 'package:state_hero/features/quiz/data/models/quiz_summary_vm.dart';
import 'package:build_context/build_context.dart';

class QuizReviewPage extends StatelessWidget {
  final QuizSummaryVm vm;

  const QuizReviewPage({Key key, @required this.vm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Answers'),
        elevation: 0,
      ),
      body: BorderedContainer(
        color: context.primaryColor,
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: vm.questions.length,
          itemBuilder: _buildItem,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          child: Text("Done"),
          onPressed: () {
            Navigator.of(context)
                .popUntil(ModalRoute.withName(Navigator.defaultRouteName));
          },
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    Question question = vm.questions[index];
    bool correct = question.answer == vm.answers[question.id];
    return BorderedContainer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              question.question,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0),
            ),
            SizedBox(height: 5.0),
            Text(
              "${vm.answers[question.id] ?? 'Not Answered'}",
              style: TextStyle(
                  color: correct ? Colors.green : Colors.red,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            correct
                ? Container()
                : Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Answer: "),
                        TextSpan(
                          text: question.answer,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    style: TextStyle(fontSize: 16.0),
                  )
          ],
        ),
      ),
    );
  }
}
