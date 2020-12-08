import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/widgets/newTransaction.dart';
import 'package:flutter_expense_planner/widgets/transactionList.dart';
import 'package:flutter_expense_planner/widgets/userTransactions.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'Open Sans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 150000,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builderContext) {
        return GestureDetector(
          child: NewTransactions(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
          style: TextStyle(fontFamily: 'Open Sans'),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
