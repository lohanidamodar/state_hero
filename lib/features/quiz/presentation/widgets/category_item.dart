import 'package:flutter/material.dart';
import 'package:state_hero/core/res/sizes.dart';

class CategoriItem extends StatelessWidget {
  const CategoriItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: AppSizes.padding),
      alignment: Alignment.center,
      child: Card(
        child: ListTile(
          title: Text("General Knowledge"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
      ),
    );
  }
}
