import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry margin;
  final double elevation;

  const CustomCard({
    Key? key,
    required this.child,
    this.onTap,
    this.margin = const EdgeInsets.all(8.0),
    this.elevation = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget card = Card(
      margin: margin,
      elevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: child,
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        child: card,
      );
    } else {
      return card;
    }
  }
}
