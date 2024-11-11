import 'package:flutter/material.dart';

class Kasir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple KASIR App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: KasirHomepage(),
    );
  }
}

class KasirHomepage extends StatefulWidget {
  @override
  _KasirHomepageState createState() => _KasirHomepageState();
}

class _KasirHomepageState extends State<KasirHomepage> {
  final List<Map<String, dynamic>> items = [
    {'name': 'Item 1', 'price': 5.0},
    {'name': 'Item 2', 'price': 10.0},
    {'name': 'Item 3', 'price': 15.0},
  ];

  final List<Map<String, dynamic>> cart = [];

  double get total => cart.fold(0, (sum, item) => sum + item['price']);

  void addItemToCart(Map<String, dynamic> item) {
    setState(() {
      cart.add(item);
    });
  }

void checkout() {
  // Simpan nilai total saat ini sebelum menghapus isi cart
  double finalTotal = total;
  
  setState(() {
    cart.clear();
  });

  // Tampilkan dialog dengan nilai total yang telah disimpan
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Checkout Complete'),
      content: Text('Thank you! Your total is \$${finalTotal.toStringAsFixed(2)}.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('OK'),
        ),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple KASIR')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Items:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Column(
              children: items.map((item) {
                return Card(
                  child: ListTile(
                    title: Text(item['name']),
                    trailing: Text('\$${item['price'].toStringAsFixed(2)}'),
                    onTap: () => addItemToCart(item),
                  ),
                );
              }).toList(),
            ),
            Divider(),
            Text('Cart:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final item = cart[index];
                  return ListTile(
                    title: Text(item['name']),
                    trailing: Text('\$${item['price'].toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            Divider(),
            Text('Total: \$${total.toStringAsFixed(2)}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: checkout,
                child: Text('Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
