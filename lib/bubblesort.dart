import 'package:flutter/material.dart';

class BubleSortPage extends StatefulWidget {
  const BubleSortPage({super.key});

  @override
  State<BubleSortPage> createState() => _BubleSortPageState();
}

class _BubleSortPageState extends State<BubleSortPage> {
  final formKey = GlobalKey<FormState>();
  final tecData = TextEditingController();
  final tecSblmUrut = TextEditingController();
  final tecStlhUrut = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buble Sort'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 8, left: 8, right: 8),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: tecData,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Data masih kosong'
                      : null,
                  decoration: InputDecoration(
                      labelText: 'Data ke-',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton(onPressed: () {}, child: Text('Input Data')),
                    ElevatedButton(onPressed: () {}, child: Text('Hapus Data')),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]),
                  child: Text('Data : []'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  maxLines: 5,
                  readOnly: true,
                  controller: tecSblmUrut,
                  decoration: InputDecoration(
                      labelText: 'Data sebelum pengurutan',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  maxLines: 5,
                  readOnly: true,
                  controller: tecStlhUrut,
                  decoration: InputDecoration(
                      labelText: 'Data setelah pengurutan',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    width: double.infinity,
                    child: FilledButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        child: Text('URUTKAN')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}