import 'package:flutter/material.dart';
import 'package:state_hero/core/data/services/api_service.dart';
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
        child: FutureBuilder(
          future: ApiService().getCategories(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Category> categories = snapshot.data;
              return ListView.builder(
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoriItem(
                    category: categories[index],
                    onTap: () =>
                        _categoryPressed(context, categories[index]),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ), /* BorderedContainer(
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
      ), */
    );
  }

  _categoryPressed(BuildContext context, Category category) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => BottomSheet(
        builder: (_) => QuizOptionsDialog(
          category: category,
        ),
        onClosing: () {},
      ),
    );
  }
}
