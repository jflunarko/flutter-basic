import 'package:flutter/material.dart';

class RichTextIcon extends StatelessWidget {
  const RichTextIcon({super.key});

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
            children: [
              TextSpan(text: 'Click', style: TextStyle(fontSize: 25)),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Icon(
                    Icons.add,
                    color: Colors.red,
                  ),
                ),
              ),
              TextSpan(text: ' to add', style: TextStyle(fontSize: 25))
            ],
          ),
        ))));
  }
}
