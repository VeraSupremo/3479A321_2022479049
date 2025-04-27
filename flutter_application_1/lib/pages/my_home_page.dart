import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logging/logging.dart';

final _homePageLogger = Logger('MyHomePage');
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title}){
    _homePageLogger.fine('MyHomePage widget alala');
  }

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
// crear la clase homestate

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() { //se crea la funcion que inicializa un widget por 1 vez
    super.initState();
    //print('Hola desde el initState de MyHomePage');
  }
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
      //persistentFooterButtons: botoncitosPersistentes, //esto es para que los botones esten siempre visibles, colocar un boton de menu o algo asi
      body: Center(
        //agregar aqui abajo el card
        child: Card(
          color: Colors.teal,
          elevation: 100 ,
          margin: EdgeInsets.fromLTRB(4 , 58, 4, 58), //esto es para mover lo sbordes de la tarjeta
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
              //aqui el row pone los botones en horizontal y no en vertical
              //se puede poner row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, //el spacearoun va ordenando los botonsitos
                children:<Widget>[
                  ElevatedButton(onPressed: _decrementCounter, child:const Icon(Icons.exposure_minus_1)),
                  ElevatedButton(onPressed: _resetCounter, child:const Icon(Icons.restart_alt)),
                  ElevatedButton(onPressed: _incrementCounter, child:const Icon(Icons.exposure_plus_1)),
                ],
              ),
            ],
          ),
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
