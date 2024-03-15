// import flutter pkgs
import 'package:flutter/material.dart';

// import project pkgs
import 'package:expense_tracker/widgets/expenses_home_sfw.dart';

void main() {
  runApp(
    const SafeArea(
      child: MaterialApp(
        home: ExpensesHomeScreenSFW(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
