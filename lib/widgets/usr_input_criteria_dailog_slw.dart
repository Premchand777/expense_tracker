// import flutter pkgs here
import 'package:flutter/material.dart';

class UsrInputCriteriaDailog extends StatelessWidget {
  const UsrInputCriteriaDailog({
    super.key,
    required this.ctx,
    required this.title,
    required this.content,
  });

  final BuildContext ctx;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
      ),
      content: Text(
        content,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop();
          },
          child: const Text(
            'Ok',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
