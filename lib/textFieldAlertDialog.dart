import 'package:flutter/material.dart';

class TextfieldalertdialogApp extends StatelessWidget {
  const TextfieldalertdialogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Textfieldalertdialog();
  }
}

class Textfieldalertdialog extends StatelessWidget {
final TextEditingController _textFieldController = TextEditingController();

  Future<void> _displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('TextField Alert Demo'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Input a word in this TextField"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('SUBMIT'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField AlertDialog Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            'Show Alert',
            style: TextStyle(fontSize: 20.0),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () => _displayDialog(context),
        ),
      ),
    );
  }
}