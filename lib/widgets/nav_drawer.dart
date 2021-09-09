import 'package:flutter/material.dart';
import 'package:myapp/screens/example.dart';

class NavDrawer extends StatefulWidget {
  NavDrawer({Key? key}) : super(key: key);

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(color: Colors.blue),),
              ListTile(
                title: Text('Example Widgets'),
                onTap: (){
                  //Update the state of app
                  Navigator.pop(context);

                  Navigator.push(context, MaterialPageRoute(builder: (context) => Example()));
                },
              )
        ]
        ),
    );
  }
}