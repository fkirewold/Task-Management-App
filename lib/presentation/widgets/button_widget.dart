import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final double? height;
  const ButtonWidget({super.key, required this.onPressed, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height??100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(30)),
            backgroundColor: Theme.of(context).primaryColor),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
