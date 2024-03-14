// import flutter pkgs
import 'package:flutter/material.dart';
// import 3rd party packages
import 'package:uuid/v4.dart';
import 'package:intl/intl.dart';

// instantiated uuid v4 class
const uuid = UuidV4();
// instantiated intl date format class
DateFormat dateFormatter = DateFormat('EEE dd MMM yyyy');

// expense enum category
enum ExpenseCategory {
  food,
  entertainment,
  travel,
  household,
}

// expense category based icons map
Map<ExpenseCategory, IconData> expenseCategoryIcons = {
  ExpenseCategory.food: Icons.restaurant_rounded,
  ExpenseCategory.entertainment: Icons.movie_creation_rounded,
  ExpenseCategory.travel: Icons.flight_takeoff_rounded,
  ExpenseCategory.household: Icons.house_rounded,
};

// Blueprint for expense related data.
class ExpenseModel {
  ExpenseModel({
    required this.title,
    required this.amount,
    required this.category,
    this.date,
  })  : id = uuid.generate();

  final String id;
  final String title;
  final double amount;
  final ExpenseCategory category;
  DateTime? date;

  String get formattedDate {
    // return the above date to readable format using intl
    return dateFormatter.format(date!);
  }

  IconData get expenseCategoryIcon {
    return expenseCategoryIcons[category]!;
  }
}
