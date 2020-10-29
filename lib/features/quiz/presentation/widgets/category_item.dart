import 'package:flutter/material.dart';
import 'package:state_hero/core/presentation/widgets/bordered_container.dart';
import 'package:state_hero/features/quiz/data/models/category.dart';

class CategoriItem extends StatelessWidget {
  final Category category;
  final Function() onTap;
  const CategoriItem({
    Key key,
    this.onTap,
    @required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      child: ListTile(
        title: Text(category.title),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: onTap,
      ),
    );
  }
}
