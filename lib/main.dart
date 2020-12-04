import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/widgets/newTransaction.dart';
import 'package:flutter_expense_planner/widgets/transactionList.dart';
import 'package:flutter_expense_planner/widgets/userTransactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // String titleInput;
  // String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Container(
              child: Text('CHART!!!'),
              width: double.infinity,
            ),
            color: Colors.blue,
            elevation: 5,
          ),
          UserTransactions(),
        ],
      ),
    );
  }
}
