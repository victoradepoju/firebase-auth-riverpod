import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          Divider(),
          Text(
            'OR',
            style: TextStyle(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
