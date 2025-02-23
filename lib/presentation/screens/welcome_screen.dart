import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/config/router.dart';
import 'package:todo/core/settings.dart';
import 'package:todo/presentation/widgets/button_widget.dart';
import 'package:todo/presentation/widgets/text_widget.dart';
import 'package:todo/presentation/widgets/textfield_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    TextEditingController controller=TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        body: Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 130, left: 15),
            child: TextWidget(
              text: 'Manage Your Daily tasks',
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
                validator: (text) {
                  if (text?.isEmpty == true) {
                    return 'Enter Your Name please';
                  }
                  return null;
                },
                hintText: 'Enter your Name',
                controller: controller),
          ),
          Expanded(child: SizedBox.shrink()),
          Padding(
            padding: const EdgeInsets.only(bottom: 35, left: 8, right: 8),
            child: ButtonWidget(
                height: 44.00,
                onPressed: () {
                  if (formKey.currentState?.validate() == true) {
                    Settings.setUserName(controller.text);
                    context.goNamed(RouteName.task);
                  }
                },
                child: TextWidget(
                  text: 'Continue',
                )),
          )
        ],
      ),
    ));
  }
}
