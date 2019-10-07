import 'package:binomnikoef/linechartdata.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';



class MyChart extends StatelessWidget {
  String graphTitle;
  List<FlSpot> spotdata;

  MyChart(this.graphTitle, this.spotdata);

  var random = new Random();

  @override
  Widget build(BuildContext context) {
    const cutOffYValue = 5.0;
    var height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;



    return Column(
      children: <Widget>[
        Row(children: <Widget>[Text(graphTitle,style: TextStyle(fontFamily: "Orbitron",fontSize: 18),)]),
        Container(
          height: 20,
        ),
        SizedBox(
          width: width * 0.8,
          height: width * 0.4,
          child: FlChart(
            chart: LineChart(
              LineChartData(
                lineTouchData: const LineTouchData(enabled: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      ...spotdata

                    ],
                    isCurved: true,
                    barWidth: 2.5,
                    colors: [
                      Colors.purpleAccent,
                    ],
                    belowBarData: BarAreaData(
                      show: true,
                      colors: [Colors.deepPurple.withOpacity(0.4)],
                      cutOffY: cutOffYValue,
                      applyCutOffY: true,
                    ),
                    aboveBarData: BarAreaData(
                      show: true,
                      colors: [Colors.orange.withOpacity(0.6)],
                      cutOffY: cutOffYValue,
                      applyCutOffY: true,
                    ),
                    dotData: const FlDotData(
                      show: false,
                    ),
                  ),
                ],
                minY: 0,
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                      showTitles: true,
                      textStyle: TextStyle(
                          fontSize: 10,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold),
                      getTitles: (value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'Prvi sat';
                          case 1:
                            return 'Drugi sat';
                          case 2:
                            return 'Treci sat';
                          case 3:
                            return 'Cetvrti sat';
                          case 4:
                            return 'Peti sat';
                          case 5:
                            return 'Sesti sat';
//                          case 6:
//                            return 'Sedmi sat';
//                          case 7:
//                            return 'Aug';
//                          case 8:
//                            return 'Sep';
//                          case 9:
//                            return 'Oct';
//                          case 10:
//                            return 'Nov';
//                          case 11:
//                            return 'Dec';
                          default:
                            return '';
                        }
                      }),
                  leftTitles: SideTitles(
                    showTitles: false,
                    getTitles: (value) {
                      return null;
                    },
                  ),
                ),
                gridData: FlGridData(
                    show: true,
                    checkToShowVerticalGrid: (double value) {
                      return value == 1 ||
                          value == 6 ||
                          value == 4 ||
                          value == 5;
                    }),
              ),
            ),
          ),
        ),
        Container(
          height: 20,
        ),
      ],
    );
  }
}
