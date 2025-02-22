import 'package:flutter/material.dart';
import 'package:todo/presentation/screens/main_screen.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Color(0xFFF5F5F5),
        ),
        home: MainScreen());
  }
}
