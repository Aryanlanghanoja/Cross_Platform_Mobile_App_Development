import 'package:flutter/material.dart';

class ColorPatternScreen extends StatefulWidget {
  const ColorPatternScreen({super.key});

  @override
  State<ColorPatternScreen> createState() => _ColorPatternScreenState();
}

class _ColorPatternScreenState extends State<ColorPatternScreen> {
  List colors = [Colors.black, Colors.red, Colors.yellow, Colors.green];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: colors[(i) % 4],
            ),
          ),
          Expanded(
            child: Container(
              color: colors[(i + 1) % 4],
            ),
          ),
          Expanded(
            child: Container(
              color: colors[(i + 2) % 4],
            ),
          ),
          Expanded(
            child: Container(
              color: colors[(i + 3) % 4],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              i++;
              setState(() {});
            },
            child: Text('Change'),
          ),
        ],
      ),
    );
  }
}
