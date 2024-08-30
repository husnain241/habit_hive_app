import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  final databaseRef = FirebaseDatabase.instance.ref('post');
  final posteditingController = TextEditingController();
  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            databaseRef
                .child(DateTime.now().millisecondsSinceEpoch.toString())
                .set({
              'id': DateTime.now().millisecondsSinceEpoch.toString(),
              'dis': posteditingController.text.toString()
            });
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('${user!.email}'),
          actions: [
            IconButton(
              onPressed: signOut,
              icon: Icon(Icons.logout_rounded),
              iconSize: 40,
            ),
          ],
        ),
        body: TextField(
          controller: posteditingController,
        ));
  }
}
