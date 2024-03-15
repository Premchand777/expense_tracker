// import flutter pkgs here
import 'package:flutter/material.dart';
// import project pkgs here
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/styles/common_styles.dart';
import 'package:expense_tracker/widgets/save_cancel_btn_slw.dart';
import 'package:expense_tracker/widgets/usr_input_field_slw.dart';

class AddExpenseBtmSheetSFW extends StatefulWidget {
  const AddExpenseBtmSheetSFW({
    super.key,
    required this.onNewExpenseAdd,
  });

  final void Function(ExpenseModel newExpense) onNewExpenseAdd;

  @override
  State<AddExpenseBtmSheetSFW> createState() => _AddExpenseBtmSheetState();
}

class _AddExpenseBtmSheetState extends State<AddExpenseBtmSheetSFW> {
  // new expense add user inputs controllers
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  DateTime? pickedDate;
  bool isDatePicked = false;

  void _openDatePicker() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    );
    if (selectedDate != null) {
      setState(() {
        pickedDate = selectedDate;
        isDatePicked = true;
      });
    }
  }

  void _saveNewExpenseAdded() {
    ExpenseModel newExpense = ExpenseModel(
      title: _titleController.text,
      amount: double.parse(_amountController.text),
      category: ExpenseCategory.values.firstWhere((category) =>
          category.toString().split('.').last ==
          _categoryController.text.toLowerCase()),
      date: pickedDate,
    );
    Navigator.pop(context);
    widget.onNewExpenseAdd(newExpense);
  }

  @override
  Widget build(BuildContext context) {
    return // SizedBox(
        //   // height: double.infinity,
        //   child:
        Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 12.0,
            bottom: 12.0,
          ),
          child: ListTile(
            title: Text(
              'New Expense',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
            titleTextStyle: headingStyleForAnAction,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 24.0,
          ),
          child: DropdownMenu(
            controller: _categoryController,
            width: 180,
            menuStyle: const MenuStyle(
              shadowColor: MaterialStatePropertyAll(
                Colors.blueGrey,
              ),
            ),
            label: const Text(
              'Category',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            initialSelection: ExpenseCategory.household,
            dropdownMenuEntries: const [
              DropdownMenuEntry(
                value: ExpenseCategory.food,
                label: 'Food',
              ),
              DropdownMenuEntry(
                value: ExpenseCategory.household,
                label: 'Household',
              ),
              DropdownMenuEntry(
                value: ExpenseCategory.travel,
                label: 'Travel',
              ),
              DropdownMenuEntry(
                value: ExpenseCategory.entertainment,
                label: 'Entertainment',
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
          ),
          child: UsrInputField(
            controller: _titleController,
            labelText: 'Title',
            keyboardType: TextInputType.name,
            maxLength: 50,
            prefix: const Text(''),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: UsrInputField(
                  controller: _amountController,
                  labelText: 'Amount',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  maxLength: 20,
                  prefix: const Padding(
                    padding: EdgeInsets.only(
                      right: 4,
                    ),
                    child: Text('₹'),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              // Expanded(
              // child:
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    isDatePicked
                        ? dateFormatter.format(pickedDate!)
                        : 'Select date',
                    style: TextStyle(
                      color:
                          isDatePicked ? const Color(0xff1c1b1f) : Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _openDatePicker();
                    },
                    icon: const Icon(
                      Icons.date_range_rounded,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              // ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
                right: 12.0,
                bottom: 24.0,
              ),
              child: SaveCancelBtnSLW(
                actionName: 'Cancel',
                onClick: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
                right: 24.0,
                bottom: 24.0,
              ),
              child: SaveCancelBtnSLW(
                actionName: 'Save',
                onClick: _saveNewExpenseAdded,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
