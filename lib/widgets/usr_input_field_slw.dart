// import flutter pkgs here
import 'package:flutter/material.dart';

/// A reusable text input field widget for user input.
///
/// This widget provides a consistent appearance and behavior for text input fields
/// with customizable label text, controller, keyboard type, maximum length, and optional prefix.
class UsrInputField extends StatelessWidget {
  /// Creates a reusable text input field widget.
  ///
  /// The [labelText], [controller], [keyboardType], and [maxLength] parameters are required.
  /// The [prefix] parameter is optional and can be used to add a prefix widget before the input field.
  const UsrInputField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    required this.maxLength,
    required this.prefix,
  });

  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLength;
  final Widget prefix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: labelText,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        labelStyle: const TextStyle(
          color: Colors.blue,
        ),
        prefix: prefix,
      ),
      cursorColor: Colors.blue,
      controller: controller,
      keyboardType: keyboardType,
      maxLength: maxLength,
    );
  }
}
