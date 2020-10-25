import 'package:flutter/material.dart';
import 'package:build_context/build_context.dart';
import 'package:state_hero/features/quiz/presentation/widgets/category_item.dart';
import 'package:state_hero/features/quiz/presentation/widgets/quiz_options_dialog.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      appBar: AppBar(
        title: Text('Choose a Category'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(32.0),
        children: <Widget>[
          CategoriItem(
            onTap: () {
              _categoryPressed(context, "General Knowledge");
            },
          ),
          CategoriItem(),
        ],
      ),
    );
  }

  _categoryPressed(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => BottomSheet(
        builder: (_) => QuizOptionsDialog(
          title: title,
        ),
        onClosing: () {},
      ),
    );
  }
}
