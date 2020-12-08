import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/models/transaction.dart';

import 'newTransaction.dart';
import 'transactionList.dart';

class UserTransactions extends StatefulWidget {
  final Function _addNewTransaction;

  UserTransactions(this._addNewTransaction);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactions(widget._addNewTransaction),
      ],
    );
  }
}
