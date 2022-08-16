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
      duration: const Duration(milliseconds: 400),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeIn,
      child: child,
    );
  }
}
