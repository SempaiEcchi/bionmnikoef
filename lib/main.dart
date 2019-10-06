import 'package:binomnikoef/brijacnica.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'myMath.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyCalculator(title: 'Binomial Coefficient'),
    );
  }
}

class MyCalculator extends StatefulWidget {
  MyCalculator({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  var result;
  Math math = Math();
  final controller = TextEditingController();
  final controller2 = TextEditingController();

  final decoration = InputDecoration(
      hintText: "number",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ));

  void calculate() {
    setState(() {
      var gore = double.parse(controller.text);
      var prvidolje = double.parse(controller2.text);

      var rezultatdoljezagrade = gore - prvidolje;

      if (rezultatdoljezagrade < 0) {
        result = "Error";
      } else {
        result = math.factorial(gore) /
            (math.factorial(prvidolje) * math.factorial(rezultatdoljezagrade));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 20,
          shape: buildAppBarShape(),
          
          centerTitle: true,
          leading: buildAction(context,Brijacnica()),
          actions: <Widget>[
            buildAction(context,Symbolab()),
          ],
          title: Text(widget.title),
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              height: 30,
            ),
            Text(
              result != null ? result.toString() : "",
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
                buildCalculatingArea(),
                Text(")", style: TextStyle(fontSize: 200)),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: buildFloatingActionButton(),
    );
  }






  Widget buildAction(BuildContext context, Widget widget ) {
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


  Widget buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: calculate,
      tooltip: 'Calculate',
      child: Icon(Icons.priority_high),
    );
  }


  Widget buildCalculatingArea() {
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
                        controller: controller,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 100,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: decoration,
                      controller: controller2,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              );
  }
}
