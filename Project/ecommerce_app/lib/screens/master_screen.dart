import 'package:ecommerce_app/screens/dashboard.dart';
import 'package:ecommerce_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart.dart';
import 'setting.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  int currIdx = 0;
  List screens = [Dashboard(), Cart(), Setting()];
  @override
  String Uname = "";

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Uname = prefs.getString('Username') ?? '';
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hii, $Uname'),
        actions: [
          IconButton(
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setString('Username', '');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              icon: Icon(Icons.power))
        ],
      ),
      body: screens[currIdx],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currIdx,
          onTap: (v) {
            currIdx = v;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}
