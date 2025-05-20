import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
}

void _decrementCounter() {
  AppData()._counter--;
}

void _resetCounter() {
  AppData()._counter = 0;
}

void _incrementCounter() {
  AppData()._counter ++;
}
