

import 'package:flutter/cupertino.dart';

class SampleProvider extends ChangeNotifier{
  var counter = 0;
  var sliderValue = 0.0;
  List<int> favourList = [];


  void incrementCounter() {
      counter++;
      print('damn0 = $counter');
      notifyListeners();
  }

  void sliderDiffer(double val) {
    sliderValue = val;
    debugPrint('damn = $sliderValue');
    debugPrint('damn0 = $val');
    notifyListeners();
  }

  void addfavour(int index) {
      favourList.add(index);
    notifyListeners();
  }

  void removefavour(int index) {
      favourList.remove(index);
    notifyListeners();
  }


}