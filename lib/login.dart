import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Field Example"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 15, vertical: 8), // Padding minimal di luar
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Input Your Username",
                    border: OutlineInputBorder()),
              ),
            ),
            // SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 15, vertical: 8), // Padding minimal di luar

              child: TextField(
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Input Your Password",
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Warna latar belakang tombol
                  foregroundColor: Colors.white, // Warna teks
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Padding dalam tombol
                ),
                onPressed: () {},
                child: Text("Sign in"),
                
              ),
            )
          ],
        ),
      ),
    );
  }
}
