import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      persistentFooterButtons: botoncitosPersistentes,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/atari.svg',
              semanticsLabel: 'Dart Logo',
            ),
            const Text('Presiona el boton artas veces:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> get botoncitosPersistentes {
    return [
      TextButton(
        onPressed: _decrementCounter,
        child: const Icon(Icons.exposure_minus_1),
      ),
      TextButton(
        onPressed: _resetCounter,
        child: const Icon(Icons.restart_alt),
      ),
      TextButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.exposure_plus_1),
      ),
    ];
  }
}
