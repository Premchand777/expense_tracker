// import flutter pkgs
import 'package:flutter/material.dart';

// import 3rd party pkgs here
import 'package:fl_chart/fl_chart.dart';

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
    double totalExpenses = 0;
    double houseHolodExpense = 0;
    double travelExpense = 0;
    double foodExpense = 0;
    double entertainmentExpense = 0;

    for (var expense in expensesList) {
      final String expCategory = expense.category.toString().split('.').last;
      if (expCategory == "household") {
        houseHolodExpense += expense.amount;
      }
      if (expCategory == "travel") {
        travelExpense += expense.amount;
      }
      if (expCategory == "food") {
        foodExpense += expense.amount;
      }
      if (expCategory == "entertainment") {
        entertainmentExpense += expense.amount;
      }
      totalExpenses += expense.amount;
    }

    houseHolodExpense = double.parse(
        ((houseHolodExpense / totalExpenses) * 100).toStringAsFixed(2));
    travelExpense = double.parse(
        ((travelExpense / totalExpenses) * 100).toStringAsFixed(2));
    foodExpense =
        double.parse(((foodExpense / totalExpenses) * 100).toStringAsFixed(2));
    entertainmentExpense = double.parse(
        ((entertainmentExpense / totalExpenses) * 100).toStringAsFixed(2));

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
        padding: const EdgeInsets.fromLTRB(8, 24, 8, 8),
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
            : Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.center,
                        titlesData: FlTitlesData(
                          leftTitles: const AxisTitles(
                            drawBelowEverything: false,
                          ),
                          rightTitles: const AxisTitles(
                            drawBelowEverything: false,
                          ),
                          topTitles: const AxisTitles(
                            drawBelowEverything: false,
                          ),
                          bottomTitles: AxisTitles(
                            axisNameSize: 24,
                            axisNameWidget: const Text(
                              'Spend analysis by category',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 32,
                              getTitlesWidget: (value, meta) {
                                switch (value.toInt()) {
                                  case 1:
                                    return const Icon(
                                      Icons.home_rounded,
                                    );
                                  case 2:
                                    return const Icon(
                                      Icons.flight_takeoff_rounded,
                                    );
                                  case 3:
                                    return const Icon(
                                      Icons.restaurant_rounded,
                                    );
                                  case 4:
                                    return const Icon(
                                      Icons.movie_rounded,
                                    );
                                  default:
                                    return const Icon(
                                      Icons.error_rounded,
                                    );
                                }
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        gridData: const FlGridData(
                          show: false,
                        ),
                        barTouchData: BarTouchData(
                          enabled: true,
                          touchTooltipData: BarTouchTooltipData(
                            fitInsideVertically: true,
                            direction: TooltipDirection.top,
                            tooltipBgColor: Colors.blue.shade50,
                          ),
                        ),
                        extraLinesData: null,
                        groupsSpace: 20,
                        barGroups: [
                          BarChartGroupData(
                            x: 1,
                            barsSpace: 25,
                            barRods: [
                              BarChartRodData(
                                toY: houseHolodExpense,
                                width: 70,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                color: Colors.blue,
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.blue,
                                    Colors.blue.shade300,
                                    Colors.blue.shade100,
                                  ],
                                ),
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barsSpace: 25,
                            barRods: [
                              BarChartRodData(
                                toY: travelExpense,
                                width: 70,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                color: Colors.blue,
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.blue,
                                    Colors.blue.shade300,
                                    Colors.blue.shade100,
                                  ],
                                ),
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barsSpace: 25,
                            barRods: [
                              BarChartRodData(
                                toY: foodExpense,
                                width: 70,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                color: Colors.blue,
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.blue,
                                    Colors.blue.shade300,
                                    Colors.blue.shade100,
                                  ],
                                ),
                              ),
                            ],
                          ),
                          BarChartGroupData(
                            x: 4,
                            barsSpace: 25,
                            barRods: [
                              BarChartRodData(
                                toY: entertainmentExpense,
                                width: 70,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                color: Colors.blue,
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.blue,
                                    Colors.blue.shade300,
                                    Colors.blue.shade100,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      swapAnimationDuration: const Duration(milliseconds: 150),
                      swapAnimationCurve: Curves.easeInCubic,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: ExpensesListSLW(
                      expenses: expensesList,
                      deleteNewExpense: _deleteNewExpense,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
