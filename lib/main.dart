// import flutter pkgs
import 'package:flutter/material.dart';

// import project pkgs
import 'package:expense_tracker/widgets/expenses_home_sfw.dart';

void main() {
  runApp(
    SafeArea(
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const ExpensesHomeScreenSFW(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
