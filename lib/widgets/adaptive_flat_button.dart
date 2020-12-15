import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String btnText;
  final Function showDatePicker;

  AdaptiveFlatButton(this.btnText, this.showDatePicker);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(btnText),
            onPressed: showDatePicker,
          )
        : FlatButton(
            onPressed: showDatePicker,
            child: Text(btnText),
            textColor: Theme.of(context).primaryColor,
          );
  }
}
