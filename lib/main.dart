import 'package:flutter/material.dart';
import 'package:myapp/landing.dart';
import 'package:myapp/screens/home_page.dart';
import 'package:myapp/screens/login.dart';


void main() => runApp(MyApp2());

class MyApp2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      routes: {
        '/': (context) => Landing(),
        '/login': (context) => Login(),
        '/home': (context) => MyHomePage(title: 'SMP APP')
      },
    );
  }
}
