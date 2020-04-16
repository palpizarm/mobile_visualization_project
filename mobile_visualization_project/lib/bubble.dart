import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BubbleChartWithAxis extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  BubbleChartWithAxis(this.seriesList, {this.animate});

  factory BubbleChartWithAxis.withSampleData() {
    return new BubbleChartWithAxis(
      _createSampleData(),
      animate: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.ScatterPlotChart(seriesList,
        primaryMeasureAxis: new charts.BucketingAxisSpec(
            threshold: 0.1,
            tickProviderSpec: new charts.BucketingNumericTickProviderSpec(
                desiredTickCount: 3)),
        behaviors: [
          new charts.SeriesLegend(position: charts.BehaviorPosition.end),
        ],
        animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final myFakeDesktopData = [
      new LinearSales(52, 0.75, 14.0),
    ];

    final myFakeTabletData = [
      new LinearSales(45, 0.3, 18.0),
    ];

    final myFakeMobileData = [
      new LinearSales(56, 0.8, 17.0),
    ];

    final myFakeChromebook = [
      new LinearSales(25, 0.6, 13.0),
    ];

    final myFakeHomeData = [
      new LinearSales(34, 0.5, 15.0),
    ];

    final myFakeOtherData = [
      new LinearSales(10, 0.25, 15.0),
      new LinearSales(12, 0.075, 14.0),
      new LinearSales(13, 0.225, 15.0),
      new LinearSales(16, 0.03, 14.0),
      new LinearSales(24, 0.04, 13.0),
      new LinearSales(37, 0.1, 14.5),
    ];

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