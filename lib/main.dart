

import 'package:midterm/addContact.dart';
import 'package:midterm/viewContact.dart';
import 'package:midterm/midtermProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<MidTermProvider>(
    create: (context) => MidTermProvider(),
    child: MaterialApp(
      home: ViewContacts(),
    ),
  ));
}
