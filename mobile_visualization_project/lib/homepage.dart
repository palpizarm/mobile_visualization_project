import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  HomePage({Key key, this.child}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
          length: 3,
          child: AppBar(
            backgroundColor: Color(0xff1976d2),
            bottom: TabBar(
              indicatorColor: Color(0xffcf1319),
              tabs: [
                Tab(icon: Icon(FontAwesomeIcons.chartLine),),
                Tab(icon: Icon(FontAwesomeIcons.solidChartBar),),
              ],
            ),
            title: Text("Población con discapacidad en Costa Rica"),
          ),
        )
    );
  }
}