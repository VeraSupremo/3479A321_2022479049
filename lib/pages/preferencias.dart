import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/changeNotifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pages/about.dart';


class Preferencias extends StatefulWidget {
  const Preferencias({super.key, required this.title});

  final String title;

  @override
  State<Preferencias> createState() {
    return _PrefState();
  }
}

class _PrefState extends State<Preferencias>{
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

}