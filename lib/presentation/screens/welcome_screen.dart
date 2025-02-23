import 'package:flutter/material.dart';
import 'package:todo/presentation/widgets/button_widget.dart';
import 'package:todo/presentation/widgets/text_widget.dart';
import 'package:todo/presentation/widgets/textfield_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:130,left:15),
          child: TextWidget(
            text: 'Welcome Task Manament',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextfieldWidget(
              hintText: 'Enter your Name',
              controller: TextEditingController()),
        ),
        Expanded(
          child: SizedBox.shrink()),
        Padding(
          padding: const EdgeInsets.only(bottom: 20,left: 8,right: 8),
          child: ButtonWidget(
            height: 44.00,
            onPressed: (){}, 
            child: TextWidget(text: 'Continue',)),
        )
      ],
    ));
  }
}
