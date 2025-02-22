import 'package:flutter/material.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      body: Center(
        child: Stack(children: [
          Container(
            height: 131,
            width: 131,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,
            ),
          ),
        
          Positioned(
            top: 50,
            left: 50,
            child: Container(
              width: 17.37,
              height: 17.37,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
          Positioned(
            child: Container(
                width: 17.37,
                height: 17.37,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFC0D6FC),
                )),
          ),
        ]),
      ),
    );
  }
}
