import 'package:flutter/material.dart';

class CircularColoredContainer extends StatelessWidget {
  const CircularColoredContainer({super.key,
  required this.bgColor,
  required this.height,
  required this.width,
  required this.child});
  final double width,height;
  final Color bgColor;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
