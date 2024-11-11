import 'package:flutter/material.dart';

class Sortingbubble extends StatefulWidget {
  const Sortingbubble({super.key});

  @override
  State<Sortingbubble> createState() => _SortingbubbleState();
}

class _SortingbubbleState extends State<Sortingbubble> {
  final formKey = GlobalKey<FormState>();
  final tecData = TextEditingController();
  final tecBeforeSort = TextEditingController();
  final tecAfterSort = TextEditingController();

  List<int> dataList = [];

  // Bubble Sort Algorithm
  List<int> bubbleSort(List<int> list) {
    for (int i = 0; i < list.length - 1; i++) {
      for (int j = 0; j < list.length - i - 1; j++) {
        if (list[j] > list[j + 1]) {
          int temp = list[j];
          list[j] = list[j + 1];
          list[j + 1] = temp;
        }
      }
    }
    return list;
  }

  // Add data to the list
  void addData() {
    if (formKey.currentState!.validate()) {
      setState(() {
        int number = int.parse(tecData.text);
        dataList.add(number);
        tecBeforeSort.text = dataList.join(', ');
        tecData.clear();
      });
    }
  }

  // Sort data and show dialog
  void sortData() async {
    // Perform sorting
    List<int> sortedList = bubbleSort(List.from(dataList));
    setState(() {
      tecAfterSort.text = sortedList.join(', ');
    });

    // Show confirmation dialog after sorting
    final ConfirmAction? action = await _asyncConfirmDialog(context);
    if (action == ConfirmAction.TryAgain) {
      clearData();
    }
  }

  // Clear data
  void clearData() {
    setState(() {
      dataList.clear();
      tecBeforeSort.clear();
      tecAfterSort.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bubble Sort'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: tecData,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter a number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter a number'
                      : null,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: addData,
                      icon: Icon(Icons.add),
                      label: Text('Add'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal[400],
                        foregroundColor: Colors.white,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: clearData,
                      icon: Icon(Icons.delete),
                      label: Text('Clear'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Data List: ${dataList.join(', ')}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: tecBeforeSort,
                  maxLines: 2,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Data before sorting',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: tecAfterSort,
                  maxLines: 2,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Data after sorting',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: sortData,
                    child: Text('SORT'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Enum for the dialog action
enum ConfirmAction { TryAgain, OK }

// Confirmation dialog to be shown after sorting
Future<ConfirmAction?> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false,
    
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Sorting Completed'),
        content: const Text('The data has been sorted successfully.'),
        actions: <Widget>[
          TextButton(
            child: const Text('Try Again'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.TryAgain);
            },
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.OK);
            },
          ),
        ],
      );
    },
  );
}
