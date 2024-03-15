// import flutter pkgs here
import 'package:flutter/material.dart';

void showSnackBarMessage(
  BuildContext ctx,
  String msg,
  Duration? duration,
  String? label,
  void Function()? onUndo,
) {
  Duration? sbDuration;
  if (duration != null) {
    sbDuration = duration;
  } else {
    sbDuration = Durations.extralong2;
  }

  SnackBarAction? action;
  if (label != null) {
    action = SnackBarAction(
      label: label,
      onPressed: onUndo!,
    );
  }

  ScaffoldMessenger.of(ctx).clearSnackBars();
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blueGrey,
      duration: sbDuration,
      action: action,
    ),
  );
}
