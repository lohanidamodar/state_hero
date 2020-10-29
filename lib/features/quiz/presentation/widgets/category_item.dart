import 'package:flutter/material.dart';

class CategoriItem extends StatelessWidget {
  final Function() onTap;
  const CategoriItem({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("General Knowledge"),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: onTap,
    );
  }
}
