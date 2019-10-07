import 'dart:math';

import 'package:flutter/material.dart';
import 'linechart.dart';
import 'package:fl_chart/fl_chart.dart';
var random = new Random();
var yValue= random.nextDouble();
var yyValue= random.nextDouble();
var yyyValue= random.nextDouble();
List<FlSpot> spotsDataMilovac = [

  FlSpot(0, random.nextDouble()),
  FlSpot(1, random.nextDouble()),
  FlSpot(2, random.nextDouble()),
  FlSpot(3, 2),
  FlSpot(4, 5),
  FlSpot(5, 10),
//  FlSpot(6, 6.5),
];


List<FlSpot> spotsDataGillete = [

  FlSpot(0, 10),
  FlSpot(1, 9),
  FlSpot(2, 8),
  FlSpot(3, 7),
  FlSpot(4, 2),
  FlSpot(5, -1),
//  FlSpot(6, 6.5),
];

List<FlSpot> buildDots() {
  return [
    FlSpot(1, 3.5),
    FlSpot(2, 4.5),
    FlSpot(3, 1),
    FlSpot(4, 4),
    FlSpot(5, 6),
    FlSpot(6, 6.5),
  ];
}