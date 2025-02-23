import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final double? height;

  final double? width;
  final Color? color;
  const ButtonWidget(
      {super.key,
      required this.onPressed,
      required this.child,
      this.width,
      this.height,
      this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
          backgroundColor: color ?? Theme.of(context).primaryColor,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
