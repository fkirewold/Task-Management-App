import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final BoxShape? shape;
  final Widget? child;
  final Border? border;
  const ContainerWidget({super.key, this.height, this.width, this.color, this.shape, this.child, this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: border,
        shape:shape??BoxShape.rectangle ,
      ),
      child:child,
    );
  }
}