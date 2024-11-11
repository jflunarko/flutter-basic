import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers to retrieve the text input from the TextFields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                controller: usernameController,
                decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Input Your Username",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 15, vertical: 8), // Padding minimal di luar
              child: TextField(
                controller: passwordController,
                obscureText: true, // Obscure text for password field
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
                  
                  backgroundColor: Colors.blueAccent, // Background color
                  foregroundColor: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Padding
                ),
                child: Text("Sign in"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Pesan Alert"),
                        content: Text(
                          "${usernameController.text}\n${passwordController.text}",
                        ),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// FLOATING BUTTON 

// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   // Controllers to retrieve the text input from the TextFields
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Text Field Example"),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(15),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: 15, vertical: 8), // Minimal padding di luar
//               child: TextField(
//                 controller: usernameController,
//                 decoration: InputDecoration(
//                     labelText: "Username",
//                     hintText: "Input Your Username",
//                     border: OutlineInputBorder()),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: 15, vertical: 8), // Minimal padding di luar
//               child: TextField(
//                 controller: passwordController,
//                 obscureText: true, // Obscure text for password field
//                 decoration: InputDecoration(
//                     labelText: "Password",
//                     hintText: "Input Your Password",
//                     border: OutlineInputBorder()),
//               ),
//             ),
//             SizedBox(height: 10),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.blueAccent,
//         child: Icon(Icons.login),
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text("Pesan Alert"),
//                 content: Text(
//                   "${usernameController.text}\n${passwordController.text}",
//                 ),
//                 actions: [
//                   TextButton(
//                     child: Text('OK'),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//     );
//   }
// }
