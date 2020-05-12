import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mobile_visualization_project/pie.dart';
import 'package:mobile_visualization_project/bar.dart';
import 'package:mobile_visualization_project/bubble.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  HomePage({Key key, this.child}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0b906c),
          leading: IconButton(icon: Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage()));
            },),
          title:
          Text(
            'Chart View',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        body: Container(
          child: StaggeredGridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: RaisedButton(
                  elevation: 14.0,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => BubbleChart()));
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text('\nPoblacion con discapacidad por tipo de discapcidad,'
                          'segun género\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                      Image.asset('assets/images/bubble.jpg'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: RaisedButton(
                  elevation: 14.0,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            PieChart()));
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text('\n\n'),
                      Image.asset('assets/images/pie.jpg'),
                      Text('\nTile of the chart',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: RaisedButton(
                  elevation: 14.0,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            BarChart()));
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text('\n\n'),
                      Image.asset('assets/images/bar.jpg'),
                      Text('\nTile of the chart',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            staggeredTiles: [
              StaggeredTile.extent(4, 500.0),
              StaggeredTile.extent(2, 350.0),
              StaggeredTile.extent(2, 350.0),
            ],
          ),
        ),
      ),
    );
  }
}