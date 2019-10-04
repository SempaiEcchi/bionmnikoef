import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';



class NedaMiSe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Niggeroloy"),
      ),
      body: Center(
        child: ActionChip(
          label: Text("Ovdje nema ništa jer mi se nije dalo"),
          onPressed: () {
            Navigator.pop(context);
            },

        ),
      ),
    );
  }
}

class Symbolab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Padding(
        padding: const EdgeInsets.only(top:18.0),
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