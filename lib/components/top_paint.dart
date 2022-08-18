// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BackgroundCustomPaint extends StatelessWidget {
  final Color frontPaintColor;
  final Color backPaintColor;
  final AnimationController controller;
  const BackgroundCustomPaint({
    Key? key,
    required this.frontPaintColor,
    required this.backPaintColor,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundPainter(
        frontPaintColor: frontPaintColor,
        backPaintColor: backPaintColor,
        controller: controller,
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final AnimationController controller;
  final Color frontPaintColor;
  final Color backPaintColor;
  BackgroundPainter({
    required this.controller,
    required this.frontPaintColor,
    required this.backPaintColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height * 0.6);
    // final paint = Paint()..color = color;
    // canvas.drawRect(shapeBounds, paint);

    _paintBlueCurve(canvas, shapeBounds);
    _paintBlackCurve(canvas, shapeBounds);
  }

  void _paintBlueCurve(Canvas canvas, Rect shapeBounds) {
    final paint = Paint()..color = backPaintColor; //rgb(88,190,230)
    final path = Path()
      ..moveTo(shapeBounds.topLeft.dx, shapeBounds.topLeft.dy)
      ..lineTo(shapeBounds.left, shapeBounds.height * 0.42)
      ..lineTo(shapeBounds.width * 0.58, shapeBounds.height * 0.75)
      ..quadraticBezierTo(
          shapeBounds.width - (shapeBounds.width / 4),
          shapeBounds.bottom,
          shapeBounds.bottomRight.dx,
          shapeBounds.bottomRight.dy)
      ..lineTo(shapeBounds.topRight.dx, shapeBounds.topRight.dy)
      ..lineTo(shapeBounds.topLeft.dx, shapeBounds.topLeft.dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  void _paintBlackCurve(Canvas canvas, Rect shapeBounds) {
    final paint = Paint()..color = frontPaintColor;
    final path = Path()
      ..moveTo(shapeBounds.left, shapeBounds.height * 0.42)
      ..lineTo(shapeBounds.left, shapeBounds.height * 0.75)
      ..quadraticBezierTo(shapeBounds.width * 0.5, shapeBounds.bottom,
          shapeBounds.width * 0.58, shapeBounds.height * 0.75)
      ..quadraticBezierTo(
          (shapeBounds.width - (shapeBounds.width / 6)),
          shapeBounds.height * 0.28,
          shapeBounds.right,
          shapeBounds.height * 0.28)
      ..lineTo(shapeBounds.topRight.dx, shapeBounds.topRight.dy)
      ..lineTo(shapeBounds.width * 0.54, shapeBounds.top)
      ..quadraticBezierTo(
          shapeBounds.width * 0.28,
          shapeBounds.height * 0.26 * 0.2,
          shapeBounds.width * 0.25,
          shapeBounds.height * 0.26)
      ..quadraticBezierTo(
        shapeBounds.width / 5,
        shapeBounds.height * 0.45,
        shapeBounds.left,
        shapeBounds.height * 0.42,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) {
    return frontPaintColor != oldDelegate.frontPaintColor;
  }
}
