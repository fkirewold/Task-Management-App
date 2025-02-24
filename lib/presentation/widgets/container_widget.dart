import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final DecorationImage? image;
  final BorderRadius? borderRadius;
  final BoxShape? shape;
  final Widget? child;
  final Border? border;
  final EdgeInsetsGeometry? padding;
  const ContainerWidget(
      {super.key,
      this.height,
      this.width,
      this.color,
      this.shape,
      this.child,
      this.border,
      this.padding,
      this.borderRadius, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        border: border,
        image: image,
        shape: shape ?? BoxShape.rectangle,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
