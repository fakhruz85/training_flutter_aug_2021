import 'package:flutter/material.dart';
import 'package:myapp/dashboard.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                  onPressed: (){
                    print('Username : '+ _usernameController.text);
                    print('Password : '+ _passwordController.text);

                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => DashboardPage())
                    );
                  },
                  child: Text('LOGIN', style: TextStyle(color: Colors.white,fontSize: 20)),
                )
              )
            ],
            ),
      ),
    );
  }
}
