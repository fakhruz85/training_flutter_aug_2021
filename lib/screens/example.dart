import 'package:flutter/material.dart';
import 'package:myapp/notesapp/page/notes_page.dart';
import 'package:myapp/screens/dashboard.dart';

class Example extends StatefulWidget {
  Example({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example Widgets'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('List of Example', style: TextStyle(fontWeight: FontWeight.bold)),
            ListTile(
              leading: Icon(Icons.more_horiz),
              title: Text('Advanced Layout'),
              onTap: (){
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => DashboardPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.more_horiz),
              title: Text('Notes App'),
              onTap: (){
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => NotesPage()));
              },
            )

          ],
        ),
      ),
    );
  }
}