import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewUserTransaction;

  const NewTransaction({Key? key, required this.addNewUserTransaction})
      : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.parse('0000-00-00');

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty ||
        enteredAmount <= 0 ||
        (_selectedDate == DateTime.parse('0000-00-00'))) {
      return;
    }

    widget.addNewUserTransaction(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDataPicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        _selectedDate = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Amount'),
                  controller: _amountController,
                  keyboardType: TextInputType.phone,
                  onSubmitted: (_) => _submitData(),
                ),
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(_selectedDate == DateTime.parse('0000-00-00')
                            ? 'No Date Chosen'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}'),
                      ),
                      TextButton(
                          onPressed: _presentDataPicker,
                          child: const Text(
                            'Chosen Date',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: _submitData,
                    child: const Text(
                      'Add Transaction',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
