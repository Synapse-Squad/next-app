import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.title, {
    super.key,
    this.style,
    this.color,
  });

  final String title;
  final TextStyle? style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style?.copyWith(color: color),
    );
  }
}
