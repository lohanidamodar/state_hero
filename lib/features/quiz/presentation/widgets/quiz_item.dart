import 'package:flutter/material.dart';
import 'package:state_hero/core/presentation/widgets/widgets.dart';
import 'package:state_hero/features/quiz/data/models/question.dart';

class QuizItem extends StatelessWidget {
  QuizItem({
    Key key,
    @required this.question,
    @required this.options,
    @required this.answer,
    @required this.questionNumber,
    this.showAnswer = false,
    @required this.onSelectAnswer,
  }) : super(key: key);

  final Question question;
  final List<String> options;
  final String answer;
  final int questionNumber;
  final bool showAnswer;
  final Function(String) onSelectAnswer;

  final TextStyle _questionStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (question.question.isNotEmpty)
            Text(
              (question.question),
              softWrap: true,
              style: _questionStyle.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : null,
              ),
            ),
          SizedBox(height: 20.0),
          _buildTextOptions(context, options, question),
        ],
      ),
    );
  }

  Column _buildTextOptions(
      BuildContext context, List<String> options, Question question) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ...options.map((option) => BorderedContainer(
              color: getColor(context, question, option),
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 0,
              ),
              child: RadioListTile(
                activeColor: Colors.white,
                selected: answer == option,
                title: Text(option),
                groupValue: answer,
                value: option,
                onChanged:
                    showAnswer && answer != null ? (x) {} : onSelectAnswer,
                secondary: showAnswer
                    ? getTrailing(
                        question,
                        option,
                      )
                    : null,
              ),
            )),
      ],
    );
  }

  getColor(BuildContext context, Question question, String option) {
    if (answer != null) {
      if (showAnswer && option == answer && answer == question.answer)
        return Colors.green;
      if (showAnswer && option == question.answer) return Colors.green;
      if (option == answer) return Theme.of(context).accentColor;
      return Theme.of(context).cardColor;
    }
    return Theme.of(context).cardColor;
  }

  Widget getTrailing(Question question, String option, {bool isLarge = true}) {
    if (answer != null) {
      if (option == question.answer)
        return Icon(
          Icons.check,
          size: isLarge ? 35 : 20,
          color: Colors.white,
        );
      if (option == answer && option != question.answer)
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.clear,
            size: isLarge ? 40 : 20,
            color: Colors.white,
          ),
        );
      return SizedBox(
        height: 0,
      );
    }
    return SizedBox(
      height: 0,
    );
  }
}
