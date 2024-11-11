import 'package:flutter/material.dart';

class Scaffoldtest extends StatelessWidget {
  const Scaffoldtest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan 04'),
      ),
      body: Center(
        child: Text('Latihan Pemrograman Mobile'),
      ),
      // Membuat BottomNavigationBar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
      // Membuat floatingActionButton
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Increment data',
        onPressed: () {},
      ),
      // Membuat lokasi dari floatingActionButton dengan floatingActionButtonLocation
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // Membuat drawer
      drawer: Drawer(
        child: Column(
          children: [
            // Membuat kepala dari Drawer
            UserAccountsDrawerHeader(
              accountName: Text('Kevin'),
              accountEmail: Text('kevinbadboyz@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Text(
                  'kevin',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            // Membuat item dari menu drawer dengan ListTile
            ListTile(
              title: Text('Menu 1'),
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: Text('Menu 2'),
              leading: Icon(Icons.camera),
            ),
            ListTile(
              title: Text('Menu 3'),
              leading: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
