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
      ..lineTo(
        shapeBounds.left,
        Tween<double>(begin: 0, end: shapeBounds.height * 0.42)
            .animate(controller)
            .value,
      )
      ..lineTo(
        shapeBounds.width * 0.58,
        Tween<double>(begin: 0, end: shapeBounds.height * 0.75)
            .animate(controller)
            .value,
      )
      ..quadraticBezierTo(
        shapeBounds.width - (shapeBounds.width / 4),
        Tween<double>(begin: 0, end: shapeBounds.bottom)
            .animate(controller)
            .value,
        shapeBounds.bottomRight.dx,
        Tween<double>(begin: 0, end: shapeBounds.bottomRight.dy)
            .animate(controller)
            .value,
      )
      ..lineTo(
        shapeBounds.topRight.dx,
        Tween<double>(begin: 0, end: shapeBounds.topRight.dy)
            .animate(controller)
            .value,
      )
      ..lineTo(
        shapeBounds.topLeft.dx,
        Tween<double>(begin: 0, end: shapeBounds.topLeft.dy)
            .animate(controller)
            .value,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  void _paintBlackCurve(Canvas canvas, Rect shapeBounds) {
    final paint = Paint()..color = frontPaintColor;
    final path = Path()
      ..moveTo(
        shapeBounds.left,
        Tween<double>(begin: 0, end: shapeBounds.height * 0.42)
            .animate(controller)
            .value,
      )
      ..lineTo(
        shapeBounds.left,
        Tween<double>(begin: 0, end: shapeBounds.height * 0.75)
            .animate(controller)
            .value,
      )
      ..quadraticBezierTo(
        shapeBounds.width * 0.5,
        Tween<double>(begin: 0, end: shapeBounds.bottom)
            .animate(controller)
            .value,
        shapeBounds.width * 0.58,
        Tween<double>(begin: 0, end: shapeBounds.height * 0.75)
            .animate(controller)
            .value,
      )
      ..quadraticBezierTo(
        (shapeBounds.width - (shapeBounds.width / 6)),
        Tween<double>(begin: 0, end: shapeBounds.height * 0.28)
            .animate(controller)
            .value,
        shapeBounds.right,
        Tween<double>(begin: 0, end: shapeBounds.height * 0.28)
            .animate(controller)
            .value,
      )
      ..lineTo(
        shapeBounds.topRight.dx,
        Tween<double>(begin: 0, end: shapeBounds.topRight.dy)
            .animate(controller)
            .value,
      )
      ..lineTo(
        shapeBounds.width * 0.54,
        Tween<double>(begin: 0, end: shapeBounds.top).animate(controller).value,
      )
      ..quadraticBezierTo(
        shapeBounds.width * 0.28,
        Tween<double>(begin: 0, end: shapeBounds.height * 0.26 * 0.2)
            .animate(controller)
            .value,
        shapeBounds.width * 0.25,
        Tween<double>(begin: 0, end: shapeBounds.height * 0.26)
            .animate(controller)
            .value,
      )
      ..quadraticBezierTo(
        shapeBounds.width / 5,
        Tween<double>(begin: 0, end: shapeBounds.height * 0.45)
            .animate(controller)
            .value,
        shapeBounds.left,
        Tween<double>(begin: 0, end: shapeBounds.height * 0.42)
            .animate(controller)
            .value,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) {
    return true;
    // frontPaintColor != oldDelegate.frontPaintColor;
  }
}
