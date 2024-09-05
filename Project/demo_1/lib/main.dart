import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Row(
        children: [
          Container(color: Colors.red, width: 100),
          Expanded(child: Container(color: Colors.blue)),
          Container(color: Colors.green, width: 200),

        ],
      ),
    ),
  ));
}
