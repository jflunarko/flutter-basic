import 'package:flutter/material.dart';

class SnackbarApp extends StatelessWidget {
  const SnackbarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Snackbar Demo'),
        ),
        body: SnackbarPage(),
      );
  }
}

class SnackbarPage extends StatelessWidget {
  const SnackbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text(
          'Show Snackbar',
          style: TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          padding: EdgeInsets.all(16),
        ),
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('This is a Snackbar message...'),
            duration: Duration(seconds: 5),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Code to undo the change
              },
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}