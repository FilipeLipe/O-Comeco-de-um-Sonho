import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;

  const CustomText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 22,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = 'Ananda',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = [];

    RegExp regExp = RegExp(r'\*\*(.*?)\*\*');
    Iterable<RegExpMatch> matches = regExp.allMatches(text);

    int lastIndex = 0;

    for (var match in matches) {
      if (match.start > lastIndex) {
        spans.add(TextSpan(
          text: text.substring(lastIndex, match.start),
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
          ),
        ));
      }

      spans.add(TextSpan(
        text: match.group(1),
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
        ),
      ));

      lastIndex = match.end;
    }

    if (lastIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastIndex),
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
        ),
      ));
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
