import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'dataHandler.dart';

class BubbleChart extends StatelessWidget {
  List<charts.Series> seriesList;
  DataHandler data;

  BubbleChart(){
    seriesList = _createSeriesChart();
    data = new DataHandler();
  }


  @override
  Widget build(BuildContext context) {
    return new charts.ScatterPlotChart(seriesList,
        animate: true,
        behaviors: [
          new charts.SeriesLegend(
            outsideJustification: charts.OutsideJustification.endDrawArea,
            horizontalFirst: false,
            desiredMaxRows: 2,
            cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
            entryTextStyle: charts.TextStyleSpec(
                color: charts.MaterialPalette.purple.shadeDefault,
                fontFamily: 'Georgia',
                fontSize: 11),
          )
        ]);
  }

  List<charts.Series<LinearSales, int>> _createSeriesChart() {
    List<charts.Series> series = [];
    for (int index = 0; index < data.disabilities.length; index++) {
      series.add(new charts.Series<String,int>(
      id:data.disabilities[index],
      colorFn: (String string,_) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (String string, _) => data.
      ));
    }
    return [
      new charts.Series<LinearSales, int>(
          id: 'Desktop',
          colorFn: (LinearSales sales, _) =>
          charts.MaterialPalette.blue.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.revenueShare,
          radiusPxFn: (LinearSales sales, _) => sales.radius,
          data: myFakeDesktopData),
      new charts.Series<LinearSales, int>(
          id: 'Tablet',
          colorFn: (LinearSales sales, _) =>
          charts.MaterialPalette.red.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.revenueShare,
          radiusPxFn: (LinearSales sales, _) => sales.radius,
          data: myFakeTabletData),
      new charts.Series<LinearSales, int>(
          id: 'Mobile',
          colorFn: (LinearSales sales, _) =>
          charts.MaterialPalette.green.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.revenueShare,
          radiusPxFn: (LinearSales sales, _) => sales.radius,
          data: myFakeMobileData),
      new charts.Series<LinearSales, int>(
          id: 'Chromebook',
          colorFn: (LinearSales sales, _) =>
          charts.MaterialPalette.purple.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.revenueShare,
          radiusPxFn: (LinearSales sales, _) => sales.radius,
          data: myFakeChromebook),
      new charts.Series<LinearSales, int>(
          id: 'Home',
          colorFn: (LinearSales sales, _) =>
          charts.MaterialPalette.indigo.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.revenueShare,
          radiusPxFn: (LinearSales sales, _) => sales.radius,
          data: myFakeHomeData),
      new charts.Series<LinearSales, int>(
          id: 'Other',
          colorFn: (LinearSales sales, _) =>
          charts.MaterialPalette.gray.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.revenueShare,
          radiusPxFn: (LinearSales sales, _) => sales.radius,
          data: myFakeOtherData),
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final double revenueShare;
  final double radius;

  LinearSales(this.year, this.revenueShare, this.radius);
}