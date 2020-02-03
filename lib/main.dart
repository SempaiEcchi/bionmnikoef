import 'package:binomnikoef/brijacnica.dart';
import 'package:binomnikoef/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'myMath.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: ChangeNotifierProvider<Factorial>(
        builder: (_) => Factorial(0),
        child: MyCalculator(
          title: "Binomial Coefficient",
        ),
      ),
    );
  }
}

class MyCalculator extends StatelessWidget {
  MyCalculator({Key key, this.title}) : super(key: key);

  final String title;

  var result;
  Math math = Math();
  var controller3 = TextEditingController();
  var controller2 = TextEditingController();
  var controller = TextEditingController();
  final decoration = InputDecoration(
      hintText: "number",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ));

  final decoration2 = InputDecoration(
      hintText: "Password",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ));

  @override
  Widget build(BuildContext context) {
    final factoricalcoef = Provider.of<Factorial>(context);

    void doOnPressed() {
      factoricalcoef.calculate();
      print(factoricalcoef.result);
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 20,
          shape: buildAppBarShape(),
          centerTitle: true,
          leading: buildAction(context, Brijacnica()),
          actions: <Widget>[
            buildAction(context, Symbolab()),
          ],
          title: Text(title),
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              height: 30,
            ),
            Text(
              factoricalcoef.result != null
                  ? factoricalcoef.result.toString()
                  : "",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "(",
                  style: TextStyle(fontSize: 200),
                ),
                buildCalcArea(factoricalcoef),
                Text(")", style: TextStyle(fontSize: 200)),
              ],
            ),

            //Svile dio

            Container(
              width: 100,
              height: 100,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: decoration2,
                controller: controller3,
                onChanged: (text){goToSvile(controller3.text.toString(), context, Svile());},

              ),
            ),
          ],
        ),
      ),
      floatingActionButton: buildFloatingActionButton(doOnPressed),
    );
  }


  void goToSvile(var pass, BuildContext context, Widget widget){

      if(pass=="Svile"){
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => widget),
      );}


  }


  Column buildCalcArea(Factorial factoricalcoef) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 58.0),
          child: Container(
            height: 100,
            width: 50,
            child: TextField(
              textAlign: TextAlign.center,
              decoration: decoration,
              controller: factoricalcoef.controller,
              keyboardType: TextInputType.number,
              onChanged: (number) {
                factoricalcoef.calculate();
              },
            ),
          ),
        ),
        Container(
          width: 50,
          height: 100,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: decoration,
            controller: factoricalcoef.controller2,
            keyboardType: TextInputType.number,
            onChanged: (number) {
              factoricalcoef.calculate();
            },
          ),
        ),
      ],
    );
  }

  Widget buildAction(BuildContext context, Widget widget) {
    return IconButton(
      icon: Icon(Icons.all_inclusive),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget),
        );
      },
    );
  }

  Widget buildFloatingActionButton(Function func) {
    return null;
    return FloatingActionButton(
      onPressed: func,
      tooltip: 'Calculate',
      child: Icon(Icons.priority_high),
    );
  }
}
