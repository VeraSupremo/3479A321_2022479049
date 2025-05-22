import 'package:flutter/material.dart';


class AppData extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  String nombre = '';
  bool posiblereset = true;
  String get nombreUsuario => nombre;
  bool get posibleresetBool => posiblereset;
  set nombreUsuario(String nuevoNombre) {// Cambia el nombre del usuario
    nombre = nuevoNombre;
    notifyListeners();
  }
  set posibleresetBool(bool nuevoValor) {// Cambia el valor de posiblereset
    posiblereset = nuevoValor;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();

  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }

  void incrementCounter() {
    _counter++;
    notifyListeners();   
  }
}
