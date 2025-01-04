import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.title, {
    super.key,
    this.style,
    this.color,
    this.maxLines,
    this.overflow,
  });

  final String title;
  final TextStyle? style;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style?.copyWith(color: color),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
