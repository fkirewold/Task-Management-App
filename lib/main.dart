import 'package:flutter/material.dart';
import 'package:todo/config/router.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0x9E0560FD),
        scaffoldBackgroundColor: Color(0xFFF5F5F5),
      ),
    );
  }
}
