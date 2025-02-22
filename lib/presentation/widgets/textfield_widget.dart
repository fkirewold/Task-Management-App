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
    border:InputBorder.none,
    hintText: hintText,
    filled: true,
    fillColor: Color.fromARGB(246, 230, 227, 228),
  ),
    );
  }
}