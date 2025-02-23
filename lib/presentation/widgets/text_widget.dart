import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const TextWidget({super.key, required this.text, this.fontSize, this.fontWeight, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:Theme.of(context).textTheme.titleMedium!.copyWith(
        fontSize:  fontSize,
        fontWeight: fontWeight,
        color: color,
      )
    );
  }
}