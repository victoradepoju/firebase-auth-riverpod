import 'package:flutter/material.dart';

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
