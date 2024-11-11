import 'package:flutter/material.dart';

class SelectoptionApp extends StatelessWidget {
  const SelectoptionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Option AlertDialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                final Product? prodName = await _asyncSimpleDialog(context);
                print("Selected Product is $prodName");
              },
              child: const Text(
                "Show Alert",
                style: TextStyle(fontSize: 20.0),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Product { Apple, Samsung, Oppo, Redmi }


Future<Product?> _asyncSimpleDialog(BuildContext context) async {
  return await showDialog<Product>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text('Select Product'),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Product.Apple);
            },
            child: const Text('Apple'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Product.Samsung);
            },
            child: const Text('Samsung'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Product.Oppo);
            },
            child: const Text('Oppo'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, Product.Redmi);
            },
            child: const Text('Redmi'),
          ),
        ],
      );
    },
  );
}