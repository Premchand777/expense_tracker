// import flutter pkgs here
import 'package:flutter/material.dart';

// import project pkgs here

class SaveCancelBtnSLW extends StatelessWidget {
  const SaveCancelBtnSLW({
    super.key,
    required this.actionName,
    required this.onClick,
  });

  final String actionName;
  final void Function() onClick;

  List<Color> _getBgColor() {
    switch (actionName) {
      case 'Save':
        return [Colors.blue];
      case 'Cancel':
        return [const Color(0xfffffbfe), Colors.blue];
      default:
        return [Colors.green];
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> btnColors = _getBgColor();

    return ElevatedButton(
      onPressed: onClick,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(btnColors[0]),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(
              color: btnColors.length == 2 ? btnColors[1] : btnColors[0],
            ),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(
            left: 26,
            right: 26,
            top: 12,
            bottom: 12,
          ),
        ),
      ),
      child: Text(
        actionName,
        style: TextStyle(
          color: btnColors.length == 2 ? Colors.blue : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
