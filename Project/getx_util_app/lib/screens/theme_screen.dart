import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Change Screen"),
      ),
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(8.0), // Define the padding value here
            child: Text(
                "Hii From Theme Screen"), // Add a child widget inside the Padding widget
          ),
          ElevatedButton(
            onPressed: () {
              Get.changeTheme(ThemeData.dark());
            },
            child: Text("Change Theme"),
          ),
        ],
      ),
    );
  }
}
