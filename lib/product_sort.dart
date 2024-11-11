import 'package:flutter/material.dart';

void main() {
  runApp(ProductSortApp());
}

class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

class ProductSortApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final formKey = GlobalKey<FormState>();
  final tecName = TextEditingController();
  final tecPrice = TextEditingController();
  List<Product> products = [];

  // Fungsi Bubble Sort untuk mengurutkan produk berdasarkan harga
  void bubbleSort(List<Product> products) {
    int n = products.length;
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        if (products[j].price > products[j + 1].price) {
          var temp = products[j];
          products[j] = products[j + 1];
          products[j + 1] = temp;
        }
      }
    }
  }

  // Fungsi untuk menambah produk ke dalam daftar
  void addProduct() {
    if (formKey.currentState!.validate()) {
      String name = tecName.text;
      double price = double.parse(tecPrice.text);
      
      setState(() {
        products.add(Product(name, price));
        tecName.clear();
        tecPrice.clear();
      });
    }
  }

  // Fungsi untuk menghapus semua produk dari daftar
  void clearProducts() {
    setState(() {
      products.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Sorter'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: tecName,
                  decoration: InputDecoration(
                    labelText: 'Nama Produk',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Nama produk tidak boleh kosong'
                      : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: tecPrice,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Harga Produk',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harga produk tidak boleh kosong';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Masukkan harga yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: addProduct,
                      child: const Text('Tambahkan Produk'),
                    ),
                    ElevatedButton(
                      onPressed: clearProducts,
                      child: const Text('Hapus Semua'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: products.map((product) {
                      return Text(
                        '${product.name} - Rp ${product.price}',
                        style: const TextStyle(fontSize: 16),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      bubbleSort(products);
                    });
                  },
                  child: const Text('Urutkan Berdasarkan Harga'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
