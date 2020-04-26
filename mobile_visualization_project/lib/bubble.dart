import 'package:flutter/material.dart';
import 'dataHandler.dart';
import 'package:bubble_chart/bubble_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BubbleChart extends StatelessWidget {
  Map<int,List<DisabilityByAge>> gender;
  String title;
  BubbleNode bubbleChart;
  DataHandler _data;

  BubbleChart() {
    bubbleChart = null;
    _data = new DataHandler();
    _loadData();
    _createData(2);
  }


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
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
                    _createData((1));
                  },
                ),
                IconButton(
                  icon: new Icon(FontAwesomeIcons.female),
                  tooltip: 'Tipo de discapacidad segun mujeres',
                  onPressed: (){
                    _createData((2));
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
              child: BubbleChartLayout(
                root: bubbleChart,
              ),
            )
          ],
        )
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
    bubbleChart = BubbleNode.node(
        children: [
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.lime,
                  child: Text(
                    seriesData[0].disability,
                    textAlign: TextAlign.center,
                  ),
              ),
              value: seriesData[0].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.purple,
                  child: Text(seriesData[1].disability,
                    textAlign: TextAlign.center,
                  ),
              ),
              value: seriesData[1].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.blue,
                  child: Text(seriesData[2].disability,
                    textAlign: TextAlign.center,
                  ),
              ),
              value: seriesData[2].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.teal,
                  child: Text(seriesData[3].disability,
                    textAlign: TextAlign.center,
                  ),
              ),
              value: seriesData[3].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.brown,
                  child:Text(seriesData[4].disability,
                    textAlign: TextAlign.center,
                  ),
              ),
              value: seriesData[4].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.red,
                  child: Text(seriesData[5].disability,
                    textAlign: TextAlign.center,
                  ),
              ),
              value: seriesData[5].quantity
          ),
          BubbleNode.leaf(
              options: BubbleOptions(
                  color: Colors.blueGrey,
                  child: Text(seriesData[6].disability,
                    textAlign: TextAlign.center,
                  ),
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