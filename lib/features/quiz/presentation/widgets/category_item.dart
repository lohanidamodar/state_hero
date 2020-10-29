import 'package:flutter/material.dart';
import 'package:state_hero/core/presentation/widgets/bordered_container.dart';

class CategoriItem extends StatelessWidget {
  final Function() onTap;
  const CategoriItem({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      child: ListTile(
        title: Text("General Knowledge"),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: onTap,
      ),
    );
  }
}
