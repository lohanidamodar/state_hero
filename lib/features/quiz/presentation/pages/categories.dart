import 'package:flutter/material.dart';
import 'package:state_hero/core/presentation/widgets/widgets.dart';
import 'package:state_hero/features/quiz/data/models/category.dart';
import 'package:state_hero/features/quiz/presentation/widgets/category_item.dart';
import 'package:state_hero/features/quiz/presentation/widgets/quiz_options_dialog.dart';
import 'package:build_context/build_context.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Category'),
      ),
      body: BorderedContainer(
        color: context.primaryColor,
        child: ListView(
          children: <Widget>[
            CategoriItem(
              category: Category(
                title: "General Knowledge",
                id: "1",
              ),
              onTap: () {
                _categoryPressed(context, "General Knowledge");
              },
            ),
            CategoriItem(
              category: Category(
                title: "Entertainment",
                id: "2",
              ),
            ),
          ],
        ),
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
