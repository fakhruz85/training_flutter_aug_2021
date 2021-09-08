import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Landing extends StatefulWidget {
  Landing({Key? key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  String _userId = "";

  @override
  void initState() { 
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString('userId') ?? "";

    if(_userId == ""){
      //push ke login
      Navigator.pushNamedAndRemoveUntil(
        context, '/login', ModalRoute.withName('/login'));
    }else{
      //call proses login
      
      //push ke home
      Navigator.pushNamedAndRemoveUntil(
        context, '/home', ModalRoute.withName('/home'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: null,
    );
  }
}