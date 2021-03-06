import 'package:flutter/material.dart';
import 'package:myapp/models/api_error.dart';
import 'package:myapp/models/api_response.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/services/api.dart';
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
      //call proses dapatkan profile daripada restful
      ApiResponse _apiResponse = await getUserDetails(_userId);

      if((_apiResponse.ApiErrors as ApiError).error == ''){
        //push ke home
        Navigator.pushNamedAndRemoveUntil(
          context, '/home', ModalRoute.withName('/home'), 
          arguments: (_apiResponse.Data as User));
      } else{
        Navigator.pushNamedAndRemoveUntil(
          context, "/login", ModalRoute.withName('/login'));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator())
    );
  }
}