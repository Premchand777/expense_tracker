// import flutter pkgs here
import 'package:flutter/material.dart';

// import project pkgs here
import 'package:expense_tracker/models/expense_model.dart';


class ExpensesListSLW extends StatelessWidget {
  const ExpensesListSLW({
    super.key,
    required this.expenses,
  });

  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              ListTile(
                title: Text(expenses[index].title),
                leading: Icon(expenses[index].expenseCategoryIcon),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 18,
                  left: 18,
                  right: 16,
                  bottom: 12,
                ),
                child: Row(
                  children: [
                    Text(
                      '₹ ${expenses[index].amount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.calendar_month_rounded,
                    ),
                    Text(
                      expenses[index].formattedDate,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
