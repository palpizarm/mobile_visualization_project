import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dataHandler.dart';
import 'package:bubble_chart/bubble_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_visualization_project/homepage.dart';
class BubbleChart extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new BubbleChartState();
}

class BubbleChartState extends State<BubbleChart> {
  Map<int,List<DisabilityByAge>> gender;
  String title = "";
  BubbleNode bubbleChart;
  DataHandler _data;

  BubbleChartState() {
    bubbleChart = null;
    _data = new DataHandler();
    _loadData();
    _createData(2);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0b906c),
          leading: IconButton(icon: Icon(Icons.arrow_back),
            tooltip: 'Volver a menu',
            onPressed: () {
              Navigator.pop(context);
            },),
          title:
          Text(
            'Censo 2011 INEC',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Text(
              'Seleccione el genero',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                  icon: new Icon(FontAwesomeIcons.male),
                  tooltip: 'Tipo de discapacidad segun hombres',
                  onPressed: () {
                    setState(() {
                      _createData((1));
                    });
                  },
                ),
                IconButton(
                  icon: new Icon(FontAwesomeIcons.female),
                  tooltip: 'Tipo de discapacidad segun mujeres',
                  onPressed: () {
                    setState(() {
                      _createData((2));
                    });
                  },
                ),
              ],
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Expanded(
              child: Center(
                child: BubbleChartLayout(
                  root: bubbleChart,
                ),
              ),
            ),
            Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  IconButton(
                    icon: new Icon(FontAwesomeIcons.info),
                    color: Colors.grey,
                  ),
                  Text("Presione la burbuja para obtener mas informacion")
                ],
            ),
          ],
        ),
    );
  }

  void _loadData() {
    List<DisabilityByAge> maleSeries = [];
    List<DisabilityByAge> femaleSeries = [];
    int maleQuantity = 0;
    int femaleQuantity = 0;
    for (int index = 0; index < _data.disabilities.length; index++) {
      for (String key in _data.maleDisabilitiesByAge.keys) {
        maleQuantity += _data.maleDisabilitiesByAge[key][index];
        femaleQuantity += _data.femaleDisabilitiesByAge[key][index];
      }
      maleSeries.add(
          new DisabilityByAge(_data.disabilities[index], maleQuantity));
      femaleSeries.add(
          new DisabilityByAge(_data.disabilities[index], femaleQuantity));
      maleQuantity = femaleQuantity = 0;
    }
    gender = {1:maleSeries,2:femaleSeries};
  }


  _createData(int genderType) {
    genderType == 1 ? title = 'Hombres con discapacidad segun tipo de discapcidad' : title = 'Mujeres con discapacidad segun tipo de discapcidad';
    List<DisabilityByAge> seriesData = gender[genderType];
    bubbleChart = new BubbleNode.node(
        children: [
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.lime,
                  child: Text(
                    seriesData[0].disability,
                    textAlign: TextAlign.center,
                  ),
                onTap: (){
                  showGeneralDialog(
                    barrierLabel: "info",
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.7),
                    transitionDuration: Duration(milliseconds: 100),
                    context: context,
                    pageBuilder: (_, __, ___) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 200,
                          child: SizedBox.expand(child: Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    title + "\n\n\n",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    seriesData[0].disability + ":" + seriesData[0].quantity.toString() ,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ],
                              )
                          ),
                          ),
                          margin: EdgeInsets.only(bottom: 25, left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
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
                },
              ),
              value: seriesData[0].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.purple,
                  child: Text(seriesData[1].disability,
                    textAlign: TextAlign.center,
                  ),
                onTap: (){
                  showGeneralDialog(
                    barrierLabel: "info",
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.7),
                    transitionDuration: Duration(milliseconds: 100),
                    context: context,
                    pageBuilder: (_, __, ___) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 200,
                          child: SizedBox.expand(child: Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    title + "\n\n\n",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    seriesData[1].disability + ":" + seriesData[1].quantity.toString() ,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ],
                              )
                          ),
                          ),
                          margin: EdgeInsets.only(bottom: 25, left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
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
                },
              ),
              value: seriesData[1].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.blue,
                  child: Text(seriesData[2].disability,
                    textAlign: TextAlign.center,
                  ),
                onTap: (){
                  showGeneralDialog(
                    barrierLabel: "info",
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.7),
                    transitionDuration: Duration(milliseconds: 100),
                    context: context,
                    pageBuilder: (_, __, ___) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 200,
                          child: SizedBox.expand(child: Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    title + "\n\n\n",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    seriesData[2].disability + ":" + seriesData[2].quantity.toString() ,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ],
                              )
                          ),
                          ),
                          margin: EdgeInsets.only(bottom: 25, left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
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
                },
              ),
              value: seriesData[2].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.teal,
                  child: Text(seriesData[3].disability,
                    textAlign: TextAlign.center,
                  ),
                onTap: (){
                  showGeneralDialog(
                    barrierLabel: "info",
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.7),
                    transitionDuration: Duration(milliseconds: 100),
                    context: context,
                    pageBuilder: (_, __, ___) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 200,
                          child: SizedBox.expand(child: Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    title + "\n\n\n",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    seriesData[3].disability + ":" + seriesData[3].quantity.toString() ,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ],
                              )
                          ),
                          ),
                          margin: EdgeInsets.only(bottom: 25, left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
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
                },
              ),
              value: seriesData[3].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.brown,
                  child:Text(seriesData[4].disability,
                    textAlign: TextAlign.center,
                  ),
                onTap: (){
                  showGeneralDialog(
                    barrierLabel: "info",
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.7),
                    transitionDuration: Duration(milliseconds: 100),
                    context: context,
                    pageBuilder: (_, __, ___) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 200,
                          child: SizedBox.expand(child: Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    title + "\n\n\n",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    seriesData[4].disability + ":" + seriesData[4].quantity.toString() ,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ],
                              )
                          ),
                          ),
                          margin: EdgeInsets.only(bottom: 25, left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
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
                },
              ),
              value: seriesData[4].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.red,
                  child: Text(seriesData[5].disability,
                    textAlign: TextAlign.center,
                  ),
                onTap: (){
                  showGeneralDialog(
                    barrierLabel: "info",
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.7),
                    transitionDuration: Duration(milliseconds: 100),
                    context: context,
                    pageBuilder: (_, __, ___) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 200,
                          child: SizedBox.expand(child: Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    title + "\n\n\n",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    seriesData[5].disability + ":" + seriesData[5].quantity.toString() ,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ],
                              )
                          ),
                          ),
                          margin: EdgeInsets.only(bottom: 25, left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
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
                },
              ),
              value: seriesData[5].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.blueGrey,
                  child: Text(seriesData[6].disability,
                    textAlign: TextAlign.center,
                  ),
                onTap: (){
                  showGeneralDialog(
                    barrierLabel: "info",
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.7),
                    transitionDuration: Duration(milliseconds: 100),
                    context: context,
                    pageBuilder: (_, __, ___) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 200,
                          child: SizedBox.expand(child: Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    title + "\n\n\n",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    seriesData[6].disability + ":" + seriesData[6].quantity.toString() ,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ],
                              )
                          ),
                          ),
                          margin: EdgeInsets.only(bottom: 25, left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
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
                },
              ),
              value: seriesData[6].quantity
          ),

        ]);
  }
}

class DisabilityByAge {
  final String disability;
  final int quantity;

  DisabilityByAge(this.disability, this.quantity);
}