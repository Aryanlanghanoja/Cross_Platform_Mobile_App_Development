import 'dart:async';
import 'package:ecommerce_app/screens/login_screen.dart';
import 'package:ecommerce_app/screens/master_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String Uname = await prefs.getString('Username') ?? '';

      if (Uname == '') {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MasterScreen()));
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Center(
                  child: Text(
            "Ecommerece App",
            style: TextStyle(fontSize: 40),
          ))),
          Center(child: Text("Developed By :- Aryan Langhanoja"))
        ],
      ),
    );
  }
}
