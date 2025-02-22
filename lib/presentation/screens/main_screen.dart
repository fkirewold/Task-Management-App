import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).scaffoldBackgroundColor ,
      body:SplashScreen(),
    );
  }
}
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        height: 131,
        width: 131,
        decoration:BoxDecoration(
          shape: BoxShape.circle,
        color: Theme.of(context).primaryColor, 
        ),
      ) ,
    );
  }
}