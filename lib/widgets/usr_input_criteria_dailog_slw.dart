// import dart pkgs here
import 'dart:io';
// import flutter pkgs here
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
    final Text $title = Text(
      title,
    );
    final Text $content = Text(
      content,
    );
    final List<Widget> $actions = [
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
    ];
    return Platform.isAndroid
        ? AlertDialog(
            title: $title,
            content: $content,
            actions: $actions,
          )
        : CupertinoAlertDialog(
            title: $title,
            content: $content,
            actions: $actions,
          );
  }
}
