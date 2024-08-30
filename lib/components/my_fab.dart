import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  final Function()? onPressed;

  const MyFloatingActionButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.add),
      backgroundColor: Color.fromARGB(255, 32, 235, 5),
      hoverColor: Color.fromARGB(255, 224, 226, 228),
    );
  }
}
