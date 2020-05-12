import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mobile_visualization_project/dataHandler.dart';
import 'package:mobile_visualization_project/homepage.dart';

class PieChart extends StatelessWidget {
  DataHandler _dataHandler;
  List<charts.Series> seriesList;

  PieChart(){
    _dataHandler = new DataHandler();
    seriesList = _createData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0b906c),
        leading: IconButton(icon: Icon(Icons.arrow_back),
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
      body: Column(
        children: <Widget>[
          Text(
            '\nTotal de personas con discapacidad segun tipo discapacidad\n',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: new charts.PieChart(
              seriesList,
              animate: true,
              behaviors: [
                new charts.DatumLegend(
                    position: charts.BehaviorPosition.top,
                    horizontalFirst: false,
                    showMeasures: true,
                    legendDefaultMeasure: charts.LegendDefaultMeasure
                        .firstValue,
                    measureFormatter: (num value) {
                      return value == null ? '-' : '${value}';
                    }
                )
              ],),
          )
        ],
      ),
    );
  }

  List<charts.Series<DisabilitiesByProvince, String>> _createData() {
    List<DisabilitiesByProvince>  disabilitiesSeries= [];
    List<Color> colors = [Color(0xff003f5c),Color(0xff374c80),Color(0xff7a5195),Color(0xffbc5090),Color(0xffef5675),Color(0xffff764a),Color(0xffffa600)];
    String key = "";
    for (int index = 0; index < _dataHandler.disabilities.length; index++) {
      int quantity  = 0;
      for (key in _dataHandler.disabilitiesByProvince.keys) {
        quantity += _dataHandler.disabilitiesByProvince[key][index];
      }
      disabilitiesSeries.add(new DisabilitiesByProvince(_dataHandler.disabilities[index], quantity,colors[index]));
    }
    return [
      new charts.Series<DisabilitiesByProvince, String>(
          id: 'data',
          domainFn: (DisabilitiesByProvince disability, _) => disability.disability,
          measureFn: (DisabilitiesByProvince disability, _) => disability.quantity,
          colorFn: (DisabilitiesByProvince disability, _) => charts.ColorUtil.fromDartColor(disability.color),
          data: disabilitiesSeries),
    ];
  }
}

class DisabilitiesByProvince {
  final String disability;
  final int quantity;
  final Color color;

  DisabilitiesByProvince(this.disability, this.quantity, this.color);
}