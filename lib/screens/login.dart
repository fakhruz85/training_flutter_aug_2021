import 'package:flutter/material.dart';
import 'package:myapp/screens/dashboard.dart';
import 'package:myapp/models/api_error.dart';
import 'package:myapp/models/api_response.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State {

  ApiResponse _apiResponse = new ApiResponse();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _handleSubmitted() async {
    _apiResponse = await authenticateUser(
      _usernameController.text, _passwordController.text);

      if((_apiResponse.ApiErrors as ApiError).error == ''){
        if(_apiResponse.Data != null){
          _saveAndRedirectToHome();
        }else{
          showInSnackBar('Unsuccessful login, Username or Password is Incorrect');
        }
      }else{
        showInSnackBar((_apiResponse.ApiErrors as ApiError).error);
      }
  }

  void showInSnackBar(String txtMsg){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(txtMsg)));
  }

  void _saveAndRedirectToHome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("userId", (_apiResponse.Data as User).token);

    Navigator.pushNamedAndRemoveUntil(
      context, '/home', ModalRoute.withName("/home"),
      arguments: (_apiResponse.Data as User)
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(this.title),
      // ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 250,
                height: 250,
                child: Image.asset("assets/pngwing.com.png"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, bottom: 10),
                child: TextFormField(
                  controller: _usernameController,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.blue
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow)
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:Colors.orange)
                    ),
                    suffixIcon: Icon(Icons.login)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, bottom: 30),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.blue
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow)
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:Colors.orange)
                    ),
                    suffixIcon: Icon(Icons.vpn_key)
                  ),
                ),
              ),
              // ElevatedButton(onPressed: (){}, child: Text('Login'))
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(35.0)
                  ),
                child : MaterialButton(
                  onPressed: _handleSubmitted, //call fname(), callback fname 
                  child: Text('LOGIN', style: TextStyle(color: Colors.white,fontSize: 20)),
                )
              )
            ],
            ),
      ),
    );
  }
}
