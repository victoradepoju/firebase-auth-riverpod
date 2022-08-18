// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:auth_firebase_riverpod/components/top_paint.dart';

class AnimatedPaint extends StatefulWidget {
  final Color frontColor;
  final Color backColor;
  final bool show;
  final String title;
  const AnimatedPaint({
    Key? key,
    required this.frontColor,
    required this.backColor,
    required this.show,
    required this.title,
  }) : super(key: key);

  @override
  State<AnimatedPaint> createState() => _AnimatedPaintState();
}

class _AnimatedPaintState extends State<AnimatedPaint>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => BackgroundCustomPaint(
            frontPaintColor: widget.frontColor,
            backPaintColor: widget.backColor,
            controller: _animationController,
          ),
        ),
      ),
    );
  }
}
