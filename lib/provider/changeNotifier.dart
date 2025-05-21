import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  String nombre = 'Userser';
  

  void decrementCounter() {
    AppData()._counter--;
    

  }

  void resetCounter() {
    AppData()._counter = 0;
    

  }

  void incrementCounter() {
    AppData()._counter++;
    
  }
}
