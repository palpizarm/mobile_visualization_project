import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'dataHandler.dart';
import 'package:bubble_chart/bubble_chart.dart';

class BubbleChart extends StatelessWidget {
  List<DisabilityByAge> maleSeries;
  List<DisabilityByAge> femaleSeries;
  BubbleNode bubbleChart;
  DataHandler _data;

  BubbleChart() {
    bubbleChart = null;
    _data = new DataHandler();
    maleSeries = [];
    femaleSeries = [];
    _loadData();
    _createData();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Cantidad de personas con discapacidad por genero',
        ),
        Expanded(
          child: BubbleChartLayout(
            root: bubbleChart,
          ),
        )
      ],
    );
  }

  void _loadData() {
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
  }


  _createData() {
    bubbleChart = BubbleNode.node(
        children: [
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.lime,
                  child: Text(
                    maleSeries[0].disability,
                    textAlign: TextAlign.center,
                  ),
              ),
              value: maleSeries[0].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.purple,
                  child: Text(maleSeries[1].disability,
                    textAlign: TextAlign.center,
                  ),
              ),
              value: maleSeries[1].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.blue,
                  child: Text(maleSeries[2].disability,
                    textAlign: TextAlign.center,
                  ),
              ),
              value: maleSeries[2].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.teal,
                  child: Text(maleSeries[3].disability,
                    textAlign: TextAlign.center,
                  ),
              ),
              value: maleSeries[3].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.brown,
                  child:Text(maleSeries[4].disability,
                    textAlign: TextAlign.center,
                  ),
              ),
              value: maleSeries[4].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.red,
                  child: Text(maleSeries[5].disability,
                    textAlign: TextAlign.center,
                  ),
              ),
              value: maleSeries[5].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.blueGrey,
                  child: Text(maleSeries[6].disability,
                    textAlign: TextAlign.center,
                  ),
              ),
              value: maleSeries[6].quantity
          ),

        ]);
    return bubbleChart;
  }
}

class DisabilityByAge {
  final String disability;
  final int quantity;

  DisabilityByAge(this.disability, this.quantity);
}