import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  // Initial values of the checkboxes
  bool valueFirst = false;
  bool valueSecond = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Checkbox Example'),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Checkbox without Header and Subtitle:',
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ),
                  Checkbox(
                    checkColor: Colors.white, // Color of the check mark
                    activeColor: Colors.red,   // Color of the checkbox itself when checked
                    value: valueFirst,
                    onChanged: (bool? newValue) {
                      setState(() {
                        valueFirst = newValue ?? false;
                      });
                    },
                  ),
                  Checkbox(
                    checkColor: Colors.white, // Adding checkColor for consistency
                    activeColor: Colors.blue, // Optional: Customize for each checkbox
                    value: valueSecond,
                    onChanged: (bool? newValue) {
                      setState(() {
                        valueSecond = newValue ?? false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
