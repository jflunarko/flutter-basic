import 'package:flutter/material.dart';

class MergeSortPage extends StatefulWidget {
  const MergeSortPage({super.key});

  @override
  State<MergeSortPage> createState() => _MergeSortPageState();
}

class _MergeSortPageState extends State<MergeSortPage> {
  final formKey = GlobalKey<FormState>();
  final tecData = TextEditingController();
  final tecSblmUrut = TextEditingController();
  final tecStlhUrut = TextEditingController();
  List<int> dataList = [];

  void inputData() {
    if (formKey.currentState!.validate() && dataList.length < 7) {
      setState(() {
        dataList.add(int.parse(tecData.text));
        tecData.clear();
        tecSblmUrut.text = dataList.toString();
      });
    }
  }

  void hapusData() {
    setState(() {
      dataList.clear();
      tecSblmUrut.clear();
      tecStlhUrut.clear();
    });
  }

  void urutkanData() {
    if (dataList.isNotEmpty) {
      List<int> sortedData = List.from(dataList);
      sortedData = mergeSort(sortedData);
      setState(() {
        tecStlhUrut.text = sortedData.toString();
      });
    }
  }

  List<int> mergeSort(List<int> list) {
    if (list.length <= 1) return list;

    int middle = list.length ~/ 2;
    List<int> left = mergeSort(list.sublist(0, middle));
    List<int> right = mergeSort(list.sublist(middle));

    return merge(left, right);
  }

  List<int> merge(List<int> left, List<int> right) {
    List<int> result = [];
    int i = 0, j = 0;

    while (i < left.length && j < right.length) {
      if (left[i] <= right[j]) {
        result.add(left[i]);
        i++;
      } else {
        result.add(right[j]);
        j++;
      }
    }

    result.addAll(left.sublist(i));
    result.addAll(right.sublist(j));

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Merge Sort'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: tecData,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Data masih kosong'
                      : null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Masukkan Angka',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(height: 20),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: inputData, child: Text('Input Data')),
                    ElevatedButton(onPressed: hapusData, child: Text('Hapus Data')),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]),
                  child: Text('Data: $dataList'),
                ),
                const SizedBox(height: 20),
                TextField(
                  maxLines: 5,
                  readOnly: true,
                  controller: tecSblmUrut,
                  decoration: InputDecoration(
                      labelText: 'Data sebelum pengurutan',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(height: 20),
                TextField(
                  maxLines: 5,
                  readOnly: true,
                  controller: tecStlhUrut,
                  decoration: InputDecoration(
                      labelText: 'Data setelah pengurutan',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: urutkanData, child: Text('URUTKAN'))
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
