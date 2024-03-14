// import flutter pkgs
import 'package:flutter/material.dart';

class AddExpenseBtnSLW extends StatelessWidget {
  const AddExpenseBtnSLW({
    super.key,
    this.onClick,
  });

  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: onClick,
      icon: const Icon(
        Icons.add,
      ),
      color: const Color.fromARGB(255, 255, 255, 255),
      highlightColor: const Color.fromARGB(94, 255, 255, 255),
      style: const ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
        side: MaterialStatePropertyAll(
          BorderSide(
            color: Color.fromARGB(87, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
