// import flutter pkgs
import 'package:flutter/material.dart';

// import project pkgs
import 'package:expense_tracker/widgets/expenses_list_slw.dart';
import 'package:expense_tracker/widgets/add_expense_btn_slw.dart';
import 'package:expense_tracker/widgets/add_expense_btm_sheet_sfw.dart';
import 'package:expense_tracker/data/expenses_data.dart';
import 'package:expense_tracker/models/expense_model.dart';

class ExpensesHomeScreenSFW extends StatefulWidget {
  const ExpensesHomeScreenSFW({
    super.key,
  });

  @override
  State<ExpensesHomeScreenSFW> createState() => ExpensesHomeScreenSFWState();
}

class ExpensesHomeScreenSFWState extends State<ExpensesHomeScreenSFW> {
  final List<ExpenseModel> expensesList = expenses;

  void _openNewExpenseSaveBottomSheet() {
    showModalBottomSheet(
      // // backgroundColor: Colors.blue,
      // enableDrag: true,
      // useSafeArea: true,
      context: context,
      builder: (ctx) {
        return AddExpenseBtmSheetSFW(onNewExpenseAdd: renderNewExpense);
      },
    );
  }

  void renderNewExpense(ExpenseModel newExpense) {
    setState(() {
      expensesList.add(newExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expenses Tracker",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            letterSpacing: 1,
            wordSpacing: 1,
          ),
        ),
        backgroundColor: Colors.blue,
        shadowColor: Colors.blueGrey,
        centerTitle: false,
        titleSpacing: 8,
        elevation: 1.25,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: AddExpenseBtnSLW(
              onClick: _openNewExpenseSaveBottomSheet,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: expensesList.isEmpty
            ? const Center(
                child: Text(
                  'Use + to save an Expense.',
                  style: TextStyle(
                    color: Color(0xff1c1b1f),
                    letterSpacing: 1,
                    wordSpacing: 1,
                  ),
                ),
              )
            : ExpensesListSLW(
                expenses: expensesList,
              ),
      ),
    );
  }
}
