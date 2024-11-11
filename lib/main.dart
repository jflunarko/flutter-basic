import 'package:flutter/material.dart';
import 'package:flutter_00/bubblesort.dart';
import 'package:flutter_00/login.dart';
import 'package:flutter_00/product_sort.dart';

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
      
      home: BubleSortPage(),
    );
  }
}
