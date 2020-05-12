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
          title:
          Text(
            'Chart View',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(FontAwesomeIcons.infoCircle),
            backgroundColor: Color(0xff0b906c),
            onPressed: () {
              showGeneralDialog(
                barrierLabel: "info",
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: Duration(milliseconds: 500),
                context: context,
                pageBuilder: (_, __, ___) {
                  return Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 300,
                      child: SizedBox.expand(child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Visualizacion de la informacion \n v.1.0 \n Pablo Alpizar Monge \n TEC",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      ),
                      ),
                      margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  );
                },
                transitionBuilder: (_, anim, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                        .animate(anim),
                    child: child,
                  );
                },
              );
            }
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
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  elevation: 5.0,
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
                      Image.asset('assets/images/bubble.jpg', height: 380,),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: RaisedButton(
                  elevation: 10.0,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
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
                      Text('\nTotal de personas con discapacidad segun tipo discapacidad',
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
                  elevation: 10.0,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
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
                      Text('\nPoblación con dicapacidad por edad segun tipo de discapacidad',
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
              StaggeredTile.extent(2, 400.0),
              StaggeredTile.extent(2, 400.0),
            ],
          ),
        ),
      ),
    );
  }
}