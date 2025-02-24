import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Function(String query)? onChanged;
  final String? labelText;
  final Widget? lebel;
  const TextfieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      this.validator,
      this.lebel, 
      this.labelText,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        label: lebel,
        labelText: labelText,
        filled: true,
        fillColor: Color.fromARGB(255, 234, 232, 232),
      ),
      onChanged:onChanged,
    );
  }
}
