// import flutter pkgs here
import 'package:flutter/material.dart';

// import project pkgs here
import 'package:expense_tracker/models/expense_model.dart';

class ExpensesListSLW extends StatelessWidget {
  const ExpensesListSLW({
    super.key,
    required this.expenses,
    required this.deleteNewExpense,
  });

  final List<ExpenseModel> expenses;
  final void Function(int index, ExpenseModel) deleteNewExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              // expenses.removeAt(index);
              deleteNewExpense(index, expenses[index]);
            }
          },
          child: Card(
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
                      Text(
                        expenses[index].formattedDate,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.calendar_month_rounded,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
