import 'package:flutter/material.dart';

void main() {
  runApp(
    SafeArea(
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const Scaffold(
          body: Text('Expense Tracker App'),
        ),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
