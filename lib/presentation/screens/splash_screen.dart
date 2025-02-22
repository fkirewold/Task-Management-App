import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (mounted) {
        GoRouter.of(context).goNamed('welcome_screen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            top: 70,
            left: 35,
            child: Transform.rotate(
              angle: 45 * pi / 180,
              child: Container(
                  width: 41.00,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFC0D6FC),
                  )),
            ),
          ),
          Positioned(
            top: 65,
            left: 70,
            child: Container(
              width: 17,
              height: 17,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 85,
            child: Container(
                width: 17.00,
                height: 17.00,
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
