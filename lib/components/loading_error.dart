import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ErrorDialog extends StatelessWidget {
  final String error;
  // Note: [._] is so we can't access the private constructor. Only the static
  // method is available.
  const ErrorDialog._(this.error, {Key? key}) : super(key: key);

  static Future<void> show(BuildContext context, String errorMessage) {
    return showDialog(
      context: context,
      builder: (_) => ErrorDialog._(errorMessage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(error),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Center(
            child: Text(
              'Okay',
              // textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }
}

class LoadingSheet extends StatelessWidget {
  const LoadingSheet._({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(48),
        ),
      ),
      context: context,
      builder: (_) => const LoadingSheet._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.blueGrey.shade700,
          size: 80,
        ),
      ),
    );
  }
}
