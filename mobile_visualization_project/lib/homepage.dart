import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_visualization_project/pie.dart';

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
          child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0b906c),
            bottom: TabBar(
              indicatorColor: Color(0xff086306),
              tabs: [
                Tab(icon: Icon(Icons.bubble_chart,color: Color(0xffffffff),size: 36.0),),
                Tab(icon: Icon(Icons.pie_chart,color: Color(0xffffffff),size: 36.0),),
                Tab(icon: Icon(Icons.insert_chart,color: Color(0xffffffff),size: 36.0),),
              ],
            ),
            title: Text("Población con discapacidad en Costa Rica"),
          ),
            body: TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    child: PieChart(),
                      )
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
              ]
            ),
        )
    )
    );
  }
}