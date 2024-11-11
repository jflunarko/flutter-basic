import 'package:flutter/material.dart';

class Radiobutton extends StatelessWidget {
  static const String _title = 'Radio Button Example';

  const Radiobutton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      );
  }
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
    BestTutorSite _site = BestTutorSite.javatpoint;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ListTile(
          title: const Text('www.javatpoint.com'),
          leading: Radio<BestTutorSite>(
            value: BestTutorSite.javatpoint,
            groupValue: _site,
            onChanged: (BestTutorSite? value) {
              setState(() {
                _site = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('www.w3schools.com'),
          leading: Radio<BestTutorSite>(
            value: BestTutorSite.w3schools,
            groupValue: _site,
            onChanged: (BestTutorSite? value) {
              setState(() {
                _site = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('www.tutorialandexample.com'),
          leading: Radio<BestTutorSite>(
            value: BestTutorSite.tutorialandexample,
            groupValue: _site,
            onChanged: (BestTutorSite? value) {
              setState(() {
                _site = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}