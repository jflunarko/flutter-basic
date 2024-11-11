import 'package:flutter/material.dart';
import 'package:flutter_00/AlertDialog.dart';
import 'package:flutter_00/ContainerTest.dart';
import 'package:flutter_00/RichTextIcon.dart';
import 'package:flutter_00/RowTest.dart';
import 'package:flutter_00/ScaffoldTest.dart';
import 'package:flutter_00/bubblesort.dart';
import 'package:flutter_00/checkbox.dart';
import 'package:flutter_00/checkboxListTitle.dart';
import 'package:flutter_00/login.dart';
import 'package:flutter_00/product_sort.dart';
import 'package:flutter_00/ColumnTest.dart';
import 'package:flutter_00/RichText.dart';
import 'package:flutter_00/RadioButton.dart';
import 'package:flutter_00/snackbar.dart';


void main() {        
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: AlertdialogApp(),
    );
  }
}
