import 'package:flutter/material.dart';
import 'package:todo/presentation/widgets/text_widget.dart';
import 'package:todo/presentation/widgets/textfield_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
  body: Column(
    children: [
      TextWidget(text: 'Wellcome Task Manament',fontSize: 14,),
      SizedBox(height: 57,),
      TextfieldWidget(hintText: 'Enter your Name please', controller: TextEditingController())
      ],
  )
    );
}
}