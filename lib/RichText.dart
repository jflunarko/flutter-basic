import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Add this import for TapGestureRecognizer

class MyRichtext extends StatelessWidget {
  const MyRichtext({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RichText Example'),
      ),
      body: Container(
        child: Center(
          child: RichText(
            text: TextSpan(
                text: 'Don\'t have account?',
                style: TextStyle(color: Colors.black, fontSize: 20),
                children: <TextSpan>[
                  TextSpan(
                      text: ' Sign up',
                      style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                      recognizer: TapGestureRecognizer()..onTap = () {})
                ]),
          ),
        ),
      ),
    );
  }
}
