import 'package:ecommerce_app/screens/master_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtUname = TextEditingController();

  TextEditingController txtPwd = TextEditingController();

  bool isHidden = true;
  String msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Form',
              style: TextStyle(fontSize: 50),
            ),
            TextField(
              controller: txtUname,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
              ),
            ),
            TextField(
              controller: txtPwd,
              obscureText: isHidden,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                suffixIcon: IconButton(
                  onPressed: () {
                    //to change visibility of password field
                    // if(isHidden)isHidden=false;else isHidden= true;
                    isHidden = !isHidden;
                    print('isHidden $isHidden');
                    setState(() {});
                  },
                  icon:
                      Icon(isHidden ? Icons.visibility : Icons.visibility_off),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                print(
                    'from login button clicked ${txtUname.text} ${txtPwd.text}');
                if (txtUname.text.isEmpty || txtPwd.text.isEmpty) {
                  msg = 'Enter details in all fields';
                } else if (txtUname.text == txtPwd.text) {
                  msg = 'welceome ${txtUname.text}';
                  // Obtain shared preferences.
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('Username', txtUname.text);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MasterScreen(),
                    ),
                  );
                } else {
                  msg = 'Invalid credentials';
                }
                print(msg);
                setState(() {});
              },
              child: Text('Login'),
            ),
            Text(msg),
          ],
        ));
  }
}
