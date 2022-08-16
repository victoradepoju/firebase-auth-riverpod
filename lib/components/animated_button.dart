// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget child;
  const AnimatedButton({
    Key? key,
    this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );

    _animation =
        Tween<double>(begin: 1, end: 0.9).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: widget.onTap == null
          ? null
          : (_) {
              _animationController.forward();
            },
      onTapUp: widget.onTap == null
          ? null
          : (_) {
              _animationController.reverse();
            },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Transform.scale(
            scale: _animation.value,
            child: widget.child,
          );
        },
      ),
    );
  }
}
