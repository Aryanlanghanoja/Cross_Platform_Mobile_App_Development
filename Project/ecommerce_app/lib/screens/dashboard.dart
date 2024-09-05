import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Dashboard'),
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Welcome, $Uname'),
        ),
      ),
    );
  }
}
