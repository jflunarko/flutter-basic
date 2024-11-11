import 'package:flutter/material.dart';

class Checkboxlisttitle extends StatefulWidget {
  const Checkboxlisttitle({super.key});

  @override
  State<Checkboxlisttitle> createState() => _CheckboxlisttitleState();
}

class _CheckboxlisttitleState extends State<Checkboxlisttitle> {
   bool valueFirst = false;
  bool valueSecond = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Checkbox Example'),
        ),
        body: Container(
          padding: EdgeInsets.all(22.0),
          child: Column(
            children: <Widget>[
              SizedBox(width: 10),
              Text(
                'Checkbox with Header and Subtitle',
                style: TextStyle(fontSize: 20.0),
              ),
              CheckboxListTile(
                secondary: Icon(Icons.alarm),
                title: Text('Ringing at 4:30 AM every day'),
                subtitle: Text('Ringing after 12 hours'),
                value: valueFirst,
                onChanged: (bool? newValue) {
                  setState(() {
                    valueFirst = newValue ?? false;
                  });
                },
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                secondary: Icon(Icons.alarm),
                title: Text('Ringing at 5:00 AM every day'),
                subtitle: Text('Ringing after 12 hours'),
                value: valueSecond,
                onChanged: (bool? newValue) {
                  setState(() {
                    valueSecond = newValue ?? false;
                  });
                },
              ),
            ],
          ),
        ),
      );
  }
}