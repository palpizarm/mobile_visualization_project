import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dataHandler.dart';

class BarChart extends StatelessWidget {
  List<charts.Series> seriesList;
  DataHandler _dataHandler;

  BarChart(){
    _dataHandler = new DataHandler();
    seriesList = _createData();
  }

  @override
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new charts.BarChart(
          seriesList,
          animate: true,
          barGroupingType: charts.BarGroupingType.groupedStacked,
          domainAxis: new charts.OrdinalAxisSpec(
            renderSpec: new charts.SmallTickRendererSpec(labelRotation: 60),
          ),
          behaviors: [
            new charts.SeriesLegend(
              position: charts.BehaviorPosition.start,
              defaultHiddenSeries: [_dataHandler.disabilities[0].substring(0,8), _dataHandler.disabilities[1], _dataHandler.disabilities[2],
                _dataHandler.disabilities[3].substring(5), _dataHandler.disabilities[4].substring(5), _dataHandler.disabilities[5].substring(4),],
            )
          ],
        ));
  }

  /// Create series list with multiple series
  List<charts.Series<DisabilitiesByAge, String>> _createData() {
    List<List<DisabilitiesByAge>> data = [];
    List<DisabilitiesByAge> series = [];
    List colors  = [charts.MaterialPalette.blue.shadeDefault.darker,charts.MaterialPalette.red.shadeDefault.darker,charts.MaterialPalette.green.shadeDefault.darker,
                    charts.MaterialPalette.lime.shadeDefault.darker, charts.MaterialPalette.purple.shadeDefault.darker, charts.MaterialPalette.gray.shadeDefault.darker,
                    charts.MaterialPalette.yellow.shadeDefault.darker];
    int index = 0;
    for(index = 0; index < 7; index++) {
      for (String key in _dataHandler.maleDisabilitiesByAge.keys) {
        series.add(new DisabilitiesByAge(key, _dataHandler.maleDisabilitiesByAge[key][index] // add male quantity to female quantity
                                                  + _dataHandler.femaleDisabilitiesByAge[key][index]));
      }
      data.add(series);
      series = [];
    }
    return [
      new charts.Series<DisabilitiesByAge, String>(
          id: _dataHandler.disabilities[0].substring(0,8),
          domainFn: (DisabilitiesByAge disabilities, _) => disabilities.age,
          measureFn: (DisabilitiesByAge disabilities, _) => disabilities.quantity,
          colorFn: (_, __) => colors[0],
          fillColorFn: (_, __) => colors[0],
          data: data[0]),
      new charts.Series<DisabilitiesByAge, String>(
          id: _dataHandler.disabilities[1],
          domainFn: (DisabilitiesByAge disabilities, _) => disabilities.age,
          measureFn: (DisabilitiesByAge disabilities, _) => disabilities.quantity,
          colorFn: (_, __) => colors[1],
          fillColorFn: (_, __) => colors[1],
          data: data[1]),
      new charts.Series<DisabilitiesByAge, String>(
          id: _dataHandler.disabilities[2],
          domainFn: (DisabilitiesByAge disabilities, _) => disabilities.age,
          measureFn: (DisabilitiesByAge disabilities, _) => disabilities.quantity,
          colorFn: (_, __) => colors[2],
          fillColorFn: (_, __) => colors[2],
          data: data[2]),
      new charts.Series<DisabilitiesByAge, String>(
          id: _dataHandler.disabilities[3].substring(5),
          domainFn: (DisabilitiesByAge disabilities, _) => disabilities.age,
          measureFn: (DisabilitiesByAge disabilities, _) => disabilities.quantity,
          colorFn: (_, __) => colors[3],
          fillColorFn: (_, __) => colors[3],
          data: data[3]),
      new charts.Series<DisabilitiesByAge, String>(
          id: _dataHandler.disabilities[4].substring(5),
          domainFn: (DisabilitiesByAge disabilities, _) => disabilities.age,
          measureFn: (DisabilitiesByAge disabilities, _) => disabilities.quantity,
          colorFn: (_, __) => colors[4],
          fillColorFn: (_, __) => colors[4],
          data: data[4],
        ),
        new charts.Series<DisabilitiesByAge, String>(
          id: _dataHandler.disabilities[5].substring(4),
          domainFn: (DisabilitiesByAge disabilities, _) => disabilities.age,
          measureFn: (DisabilitiesByAge disabilities, _) => disabilities.quantity,
          colorFn: (_, __) => colors[5],
          fillColorFn: (_, __) => colors[5],
          data: data[5]),
      new charts.Series<DisabilitiesByAge, String>(
          id: _dataHandler.disabilities[6].substring(4),
          domainFn: (DisabilitiesByAge disabilities, _) => disabilities.age,
          measureFn: (DisabilitiesByAge disabilities, _) => disabilities.quantity,
          colorFn: (_, __) => colors[6],
          fillColorFn: (_, __) => colors[6],
          data: data[6]),
    ];
  }
}

class DisabilitiesByAge {
  final String age;
  final int quantity;

  DisabilitiesByAge(this.age , this.quantity);
}