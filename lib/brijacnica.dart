import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';



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
          title: Text("Bilješka"),
        ),
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





RoundedRectangleBorder buildAppBarShape() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(33),

    ),
  );
}
