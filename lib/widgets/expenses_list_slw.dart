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
            elevation: 3,
            shadowColor: Colors.blueGrey,
            surfaceTintColor: const Color.fromARGB(255, 97, 174, 236),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    expenses[index].title,
                    textAlign: TextAlign.right,
                  ),
                  leading: Icon(expenses[index].expenseCategoryIcon),
                  horizontalTitleGap: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 18,
                    right: 18,
                    bottom: 20,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '₹ ${expenses[index].amount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 16,
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
