import 'package:flutter/material.dart';

class ContainerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(title: Text('Latihan Container')),
        body: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 4),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: Colors.teal, offset: Offset(3, 3)),
            ],
          ),
          child: Text(
            'Hallo.....ini merupakan contoh sebuah widget Container',
            style: TextStyle(fontSize: 25),
          ),
          width: double.infinity,
          height: 150,
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(0.1),
        ),
      ),
    );
  }
}

void main() => runApp(ContainerTest());
