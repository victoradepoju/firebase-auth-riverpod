// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SizeFadeSwitcher extends StatelessWidget {
  final Widget child;
  const SizeFadeSwitcher({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        final sizeAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            //CurvedAnimatino for Staggered Animation
            parent: animation,
            curve: const Interval(
              0.0,
              0.5,
            ),
          ),
        );

        final fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: animation,
            curve: const Interval(
              0.5,
              1.0,
            ),
          ),
        );
        return FadeTransition(
          opacity: fadeAnimation,
          child: SizeTransition(
            sizeFactor: sizeAnimation,
            child: child,
          ),
        );
      },
      duration: const Duration(milliseconds: 400),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeIn,
      child: child,
    );
  }
}
