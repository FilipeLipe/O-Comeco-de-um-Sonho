import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  final double? height;
  final double? size;
  final TextAlign? align;
  final MaterialColor? color;

  const CustomTitle({
    Key? key,
    this.height = 1.5,
    this.size = 80,
    this.color = Colors.teal,
    this.align = TextAlign.center,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontFamily: 'Mordis',
        fontSize: size,
        color: color,
        height: height,
      ),
    );
  }
}
