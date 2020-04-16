import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey,
      ),
      drawer : Drawer (
        child: ListView (
          children: <Widget>[
            DrawerHeader (
              child: Text('Options'),
              decoration: BoxDecoration(
                color: Colors.blueAccent
              ),
            ),
            ListTile (
              title: Text('option 1'),
              onTap: () {

              },
            ),
            Divider(height: 15,),
            ListTile(
              title: Text('option 2'),
              onTap: () {

              },
            ),
            Divider(height: 15,),
          ],
        )
      )
    );
  }
}
