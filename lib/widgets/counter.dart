// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int a;
  final int b;
  const Counter({Key? key, required this.a, required this.b}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26),
      child: Text("$a/$b",
          style: TextStyle(
              fontSize: 44,
              color: a==b?  Color.fromARGB(237, 0, 238, 12) : Color.fromARGB(255, 218, 202, 154),
              fontWeight: FontWeight.bold)),
    );
  }
}
