// import flutter pkgs
import 'package:flutter/material.dart';

// import project pkgs
import 'package:expense_tracker/widgets/expenses_list_slw.dart';
import 'package:expense_tracker/widgets/add_expense_btn_slw.dart';
import 'package:expense_tracker/widgets/add_expense_btm_sheet_sfw.dart';
import 'package:expense_tracker/data/expenses_data.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/app_reusable_widgets.dart';

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
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return AddExpenseBtmSheetSFW(saveNewExpense: _saveNewExpense);
      },
    );
  }

  void _saveNewExpense(ExpenseModel newExpense) {
    setState(() {
      expensesList.add(newExpense);
    });
    showSnackBarMessage(
      context,
      'New expense added successfully.',
      null,
      null,
      null,
    );
  }

  void _deleteNewExpense(int index, ExpenseModel toDeleteExpense) {
    setState(() {
      expensesList.removeAt(index);
    });
    showSnackBarMessage(
      context,
      'Expense deleted successfully.',
      const Duration(seconds: 3),
      'Undo',
      () {
        setState(() {
          expensesList.insert(index, toDeleteExpense);
        });
      },
    );
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
        titleSpacing: 16,
        elevation: 1.25,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
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
                deleteNewExpense: _deleteNewExpense,
              ),
      ),
    );
  }
}
