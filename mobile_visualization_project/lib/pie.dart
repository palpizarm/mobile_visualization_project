import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mobile_visualization_project/dataHandler.dart';

class PieChart extends StatelessWidget {
  DataHandler _dataHandler;
  List<charts.Series> seriesList;

  PieChart(){
    _dataHandler = new DataHandler();
    seriesList = _createData();
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
      seriesList,
      animate: true,
        defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.outside)
        ])
    );
  }

  List<charts.Series<DisabilitiesByProvince, String>> _createData() {
    List<DisabilitiesByProvince> provinces = [];
    int index = 0;
    for (int quantity in _dataHandler.disabilitiesByProvince['San Jose']) {
        provinces.add(new DisabilitiesByProvince(_dataHandler.disabilities[index],quantity));
        index++;
    }
    return [
      new charts.Series<DisabilitiesByProvince, String>(
          id: _dataHandler.disabilities[0],
          domainFn: (DisabilitiesByProvince disabilities, _) => disabilities.disability,
          measureFn: (DisabilitiesByProvince disabilities, _) => disabilities.quantity,
          data: provinces),
    ];
  }
}

class DisabilitiesByProvince {
  final String disability;
  final int quantity;

  DisabilitiesByProvince(this.disability, this.quantity);
}