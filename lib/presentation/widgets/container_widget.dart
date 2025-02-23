import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final BoxShape? shape;
  final Widget? child;
  const ContainerWidget({super.key, this.height, this.width, this.color, this.shape, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        shape:shape??BoxShape.rectangle ,
      ),
    );
  }
}