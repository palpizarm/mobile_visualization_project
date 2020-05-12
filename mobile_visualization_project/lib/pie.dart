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
            'Total de personas con discapacidad segun tipo discapacidad',
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
                    // Configure the measure value to be shown by default in the legend.
                    legendDefaultMeasure: charts.LegendDefaultMeasure
                        .firstValue,
                    // Optionally provide a measure formatter to format the measure value.
                    // If none is specified the value is formatted as a decimal.
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
    String key = "";
    for (int index = 0; index < _dataHandler.disabilities.length; index++) {
      int quantity  = 0;
      for (key in _dataHandler.disabilitiesByProvince.keys) {
        quantity += _dataHandler.disabilitiesByProvince[key][index];
      }
      disabilitiesSeries.add(new DisabilitiesByProvince(_dataHandler.disabilities[index], quantity));
    }
    return [
      new charts.Series<DisabilitiesByProvince, String>(
          id: 'data',
          domainFn: (DisabilitiesByProvince disabilities, _) => disabilities.disability,
          measureFn: (DisabilitiesByProvince disabilities, _) => disabilities.quantity,
          data: disabilitiesSeries),
    ];
  }
}

class DisabilitiesByProvince {
  final String disability;
  final int quantity;

  DisabilitiesByProvince(this.disability, this.quantity);
}