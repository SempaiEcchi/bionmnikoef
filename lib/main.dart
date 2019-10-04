import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'newpage.dart';
void main() => runApp(MyApp());
class Math {
  double factorial(double n) {
    double total = 1.0;
    double i = 1.0;
    while (i <= n) {
      total = total * i;
      i = i + 1.0;
    }

    return total;
  }
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Binomni Koeficijent'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double result = 0;
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
var gore=double.parse(controller.text);
var prvidolje= double.parse(controller2.text);
var rezultatdoljezagrade=gore-prvidolje;


      result=math.factorial(gore)/(math.factorial(prvidolje)*math.factorial(rezultatdoljezagrade));


    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.all_inclusive),onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NedaMiSe()),
          );
        } ,),

        actions: <Widget>[
          IconButton(icon: Icon(Icons.all_inclusive),onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Symbolab()),
            );
          }),
        ],
        title: Text(widget.title),
      ),
      body: Center(

        child: ListView(

//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(height: 30,),
            Text(result.toString(),textAlign: TextAlign.center ,style: TextStyle(fontSize: 25),),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(

                    "(",style: TextStyle(fontSize: 200),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:58.0),
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
                ),
                Text(
                    ")",style: TextStyle(fontSize: 200)
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: calculate,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
