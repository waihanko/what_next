import 'package:flutter/material.dart';

class GradientButtonWidget extends StatelessWidget {
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final double radiusFactor;

  const GradientButtonWidget({
    Key? key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height = 44.0,
    this.radiusFactor = 0.2,
    this.gradient = const LinearGradient(
      colors: [
        Color(0xfff7de55),
        Color(0xfffdc65f),
        Color(0xffe99436),
      ],
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(height * radiusFactor),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(height * radiusFactor)),
        ),
        child: child,
      ),
    );
  }
}
