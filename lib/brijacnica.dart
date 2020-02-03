import 'package:binomnikoef/linechartdata.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

import 'linechart.dart';

class Brijacnica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            elevation: 20,
            shape: buildAppBarShape(),
            centerTitle: true,
            title: Text("Brijačnica"),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(height: 25,),
                buildChartRow("Gillete", spotsDataGillete),
                buildChartRow("Milovac", spotsDataMilovac),

              ],
            )
          ],
        ));
  }

  Row buildChartRow(String title, List<FlSpot> spotDataList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyChart(title,spotDataList),
      ],
    );
  }
}

class Symbolab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Center(
          child: SizedBox(
            child: InAppWebView(
              initialUrl: "https://www.google.com",
            ),
          ),
        ),
      ),
    );
  }
}

RoundedRectangleBorder buildAppBarShape() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(33),
    ),
  );
}





class Svile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            elevation: 20,
            shape: buildAppBarShape(),
            centerTitle: true,
            title: Text("Franova radiona"),
          ),
        ),
        body: ListView(
          children: <Widget>[

            Column(
              children: <Widget>[


              ],
            )
          ],
        ));
  }

}