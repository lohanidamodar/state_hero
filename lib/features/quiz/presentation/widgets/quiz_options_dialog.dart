import 'package:flutter/material.dart';
import 'package:state_hero/core/presentation/app_state.dart';
import 'package:state_hero/core/res/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_hero/features/quiz/presentation/notifiers/quiz_state.dart';

final _noOfQuestionProvider = StateProvider((ref)=> 10);
final _processingProvider = StateProvider((ref)=> false);
final practiceModeProvider = StateProvider((ref)=> false);

class QuizOptionsDialog extends ConsumerWidget {
  @override
  Widget build(BuildContext context,ScopedReader watch) {
    final category = watch(quizStateProvider).category;
    return SingleChildScrollView(
      child: Consumer(
        builder: (context,watch,child){
          final _noOfQuestions = watch(_noOfQuestionProvider).state;
          final _processing = watch(_processingProvider).state;
          final _practiceMode = watch(practiceModeProvider).state;
          return Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey.shade200,
              child: Text(
                category.title,
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
                    onPressed: () => _selectNumberOfQuestions(context,10),
                  ),
                  ActionChip(
                    label: Text("20"),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == 20
                        ? Colors.indigo
                        : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(context,20),
                  ),
                  ActionChip(
                    label: Text("30"),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == 30
                        ? Colors.indigo
                        : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(context,30),
                  ),
                  ActionChip(
                    label: Text("40"),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == 40
                        ? Colors.indigo
                        : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(context,40),
                  ),
                  ActionChip(
                    label: Text("50"),
                    labelStyle: TextStyle(color: Colors.white),
                    backgroundColor: _noOfQuestions == 50
                        ? Colors.indigo
                        : Colors.grey.shade600,
                    onPressed: () => _selectNumberOfQuestions(context,50),
                  ),
                ],
              ),
            ),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: _practiceMode,
              title: Text("Practice Mode"),
              onChanged: (val) {
                context.read(practiceModeProvider).state = val;
              },
            ),
            SizedBox(height: 20.0),
            _processing
                ? CircularProgressIndicator()
                : ElevatedButton(
                    child: Text("Start Quiz"),
                    onPressed: () => _startQuiz(context),
                  ),
            SizedBox(height: 20.0),
          ],
        );
        },
      ),
    );
  }

  _selectNumberOfQuestions(BuildContext context,int i) {
    context.read(_noOfQuestionProvider).state = i;
  }

  void _startQuiz(BuildContext context) async {
    //get questions
    final quizState = context.read(quizStateProvider);
    final category= quizState.category;
    final questions = await context.read(apiService)
        .getQuestion(categoryId: category.id, limit: context.read(_noOfQuestionProvider).state);
    if (questions != null) {
      quizState.questions = questions;
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.quiz,
      );
    }
  }
}
