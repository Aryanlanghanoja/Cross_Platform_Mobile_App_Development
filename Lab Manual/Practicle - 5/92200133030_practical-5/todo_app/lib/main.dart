import 'package:flutter/material.dart'; // Importing Flutter material package for UI components
import 'package:flutter/services.dart'; // Importing Flutter services package for system UI control
import './view/home.dart'; // Importing the Home widget from the view directory

void main() {
  runApp(
      const MyApp()); // Running the MyApp widget as the root of the application
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for MyApp with a key parameter

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Setting the system UI overlay style to make the status bar transparent
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    // Building the MaterialApp widget which serves as the main app structure
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Hiding the debug banner in the app
      title: 'ToDo App', // Setting the title of the application
      home: Home(), // Specifying the Home widget as the starting screen
    );
  }
}
