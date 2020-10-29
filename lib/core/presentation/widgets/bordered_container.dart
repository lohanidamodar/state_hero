import 'package:flutter/material.dart';
import 'package:state_hero/core/res/sizes.dart';

class BorderedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color color;

  const BorderedContainer({
    Key key,
    this.child,
    this.margin,
    this.padding,
    this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: color,
        margin: margin ?? const EdgeInsets.all(AppSizes.margin),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(0),
          child: child,
        ),
      ),
    );
  }
}
