



import 'package:flutter/material.dart';

import 'myMath.dart';

class Factorial with ChangeNotifier {
  var result;
  Math math = Math();
  final controller = TextEditingController();
  final controller2 = TextEditingController();

  Factorial(this.result);


//  getValue() => result;
//  setValue(var tresult) => result = tresult;



  void calculate() {
      var gore = double.parse(controller.text);
      var prvidolje = double.parse(controller2.text);
      var rezultatdoljezagrade = gore - prvidolje;

      if (rezultatdoljezagrade < 0) {
        result = "Error";
      }
      else {
        result = math.factorial(gore) /
            (math.factorial(prvidolje) * math.factorial(rezultatdoljezagrade));
      }
      notifyListeners();
  }



}