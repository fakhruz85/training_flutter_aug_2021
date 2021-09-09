import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  void _handleLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userId");

    Navigator.pushNamedAndRemoveUntil(context, '/login', ModalRoute.withName("/login"));
  }

  @override
  Widget build(BuildContext context) {
    final User args = ModalRoute.of(context)?.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Welcome back " + args.username + "!"),
            Text("Your User Id is " + args.userId.toString()),
            MaterialButton(
              onPressed: _handleLogout,
              child: Text('LOGOUT', style: TextStyle(color: Colors.red,fontSize: 20)))
          ],
        )),
    );
  }
}