import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {

  final String hintText;
  final TextEditingController controller;
  const TextfieldWidget({super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
  controller: controller,
  decoration: InputDecoration(
    hintText: hintText,
    filled: true,
    fillColor: Colors.white,
  ),
    );
  }
}