import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  TextEditingController email = TextEditingController();

  reset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset email sent successfully.'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget'),
        centerTitle: true, // Center the title
        backgroundColor: Colors.teal, // Set the app bar color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.green],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Center the column vertically
              children: [
                SizedBox(
                  width: 300, // Set the width of the text field
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .transparent), // Make the border transparent
                      ),
                      prefixIcon: Icon(Icons.email),
                      filled: true,
                      fillColor: Colors.white.withOpacity(
                          0.5), // Set the background color with opacity
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: reset,
                  child: Text('Send Email'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    // Set the button color to teal
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    textStyle: TextStyle(fontSize: 18),
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
