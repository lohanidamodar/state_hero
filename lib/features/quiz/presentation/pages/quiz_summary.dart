import 'package:flutter/material.dart';
import 'package:state_hero/core/presentation/widgets/bordered_container.dart';
import 'package:state_hero/features/quiz/data/models/quiz_summary_vm.dart';
import 'package:build_context/build_context.dart';

class QuizSummaryPage extends StatelessWidget {
  final QuizSummaryVm vm;
  QuizSummaryPage({
    Key key,
    @required this.vm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int correct = this.vm.correctCount;
    final TextStyle titleStyle = TextStyle(
        color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.w500);
    final TextStyle trailingStyle = TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        elevation: 0,
      ),
      body: BorderedContainer(
        color: context.primaryColor,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              BorderedContainer(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Total Questions", style: titleStyle),
                  trailing:
                      Text("${vm.questions.length}", style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              BorderedContainer(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Score", style: titleStyle),
                  trailing: Text("${correct / vm.questions.length * 100}%",
                      style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              BorderedContainer(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Correct Answers", style: titleStyle),
                  trailing: Text("$correct/${vm.questions.length}",
                      style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              BorderedContainer(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Incorrect Answers", style: titleStyle),
                  trailing: Text(
                      "${vm.questions.length - correct}/${vm.questions.length}",
                      style: trailingStyle),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: context.primaryColor,
                        elevation: 0,
                        padding: const EdgeInsets.all(24.0)),
                    child: Text("Goto Home"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: context.primaryColor,
                        elevation: 0,
                        padding: const EdgeInsets.all(24.0)),
                    child: Text("Check Answers"),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
