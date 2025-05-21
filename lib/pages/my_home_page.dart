import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/changeNotifier.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
    print("STATE");
    return _MyHomePageState();
  }
}
// crear la clase homestate

class _MyHomePageState extends State<MyHomePage> {
  @override
  _MyHomePageState() {
    //print("Lirililarila");
    print("$mounted");
  }

  @override
  void initState() {
    super.initState(); //se crea la funcion que inicializa un widget por 1 vez
    print('Widget inicializado');
    // Aquí puedes inicializar controladores, hacer llamadas API iniciales, etc.
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('Dependencias cambiadas');
    //cambios en dependencias del widget.
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print(
      'Widget actualizado',
    ); //se puede reaccionar a cambios en el widget antes de que se vuelva a construir
  }

  @override
  void deactivate() {
    //se llama cuando el widget se elimina de la arbol de widgets
    super.deactivate();
    print('widget desactivao');
  }

  @override
  void dispose() {
    print('widget eliminao');
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reensamblando widget");
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
    print("BuildBuild");
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
          elevation: 100,
          margin: EdgeInsets.fromLTRB(
            4,
            58,
            4,
            58,
          ), //esto es para mover lo sbordes de la tarjeta
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35), // Bordes redondeados
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Flutter es genial'),
              const Text('Dart es genial...(pero no tanto)'),
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
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceAround, //el spacearoun va ordenando los botonsitos
                children: <Widget>[
                  ElevatedButton(
                    onPressed: context.read<AppData>().decrementCounter,
                    child: const Icon(Icons.exposure_minus_1),
                  ),
                  ElevatedButton(
                    onPressed: context.read<AppData>().resetCounter,
                    child: const Icon(Icons.restart_alt),
                  ),
                  ElevatedButton(
                    //onPressed: context.read<AppData>()._counter,
                    onPressed: context.read<AppData>().incrementCounter,
                    child: const Icon(Icons.exposure_plus_1),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListaContenido()),
                  );
                },
                child: const Text('Llendo a otra pagina'),
              ),
              Text(
                context.read<AppData>().counter > 0 ? 'Numeros positivitos' : 'Numeros negativitos',
                style: TextStyle(
                  color: context.read<AppData>().counter > 0 ? Colors.green : Colors.yellowAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
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
        onPressed:context.read<AppData>().decrementCounter,
        child: const Icon(Icons.exposure_minus_1),
      ),
      TextButton(
        onPressed:context.read<AppData>().resetCounter,
        child: const Icon(Icons.restart_alt),
      ),
      TextButton(
        onPressed: context.read<AppData>().incrementCounter,

        child: const Icon(Icons.exposure_plus_1),
      ),
    ];
  }
}

//Aqui agregar la clase listaContenido extend statelesswidget
class ListaContenido extends StatelessWidget {
  ListaContenido({super.key});

  final List<String> items = [
    'palabra xd',
    'palabra 2',
    'Elemento 1',
    'palabra 3',
    'palabra 4',
    'palabra 5',
    'Elemento 2',
    'Elemento 3',
    'palabra 6',
    'palabra 7',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prueba segunda pantalla')),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 400,

          child: Card(
            color: const Color.fromARGB(
              255,
              44,
              109,
              53,
            ), //esto es para el color de la tarjeta
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35), // Bordes redondeados
            ),
            elevation: 100,
            margin: const EdgeInsets.fromLTRB(
              2,
              58,
              2,
              58,
            ), //esto es para mover los bordes de la tarjeta
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Contenido de la lista'),
                const SizedBox(height: 20), // Espacio entre widgets
                ElevatedButton(
                  onPressed: () {
                    // Acción boton 1
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Misterioso boton')),
                    );
                  },
                  child: const Text('Botón 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción Botón 2
                    Navigator.pop(context); // Regresa a la pantalla anterior
                  },
                  child: const Text('Volver'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Sobre()),
                    );
                  },
                  child: const Text('Pagina 3'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prueba tercera pantalla')),
      body: Center(
        child: Card(
          color: const Color.fromARGB(
            255,
            146,
            255,
            119,
          ), //esto es para el color de la tarjeta
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35), // Bordes redondeados
          ),
          elevation: 100,
          margin: const EdgeInsets.fromLTRB(
            4,
            58,
            4,
            58,
          ), //esto es para mover los bordes de la tarjeta
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Sobre esto:'),
              const Text(
                'La Pestaña es un proyecto de prueba para aprender Flutter y Dart.',
              ),
              const Text('Creado por: [Martin Vera]'),
              const Text(
                'Si esto no es un proyecto de prueba, entonces no se que es.',
              ),
              const SizedBox(height: 20), // Espacio entre widgets
              ElevatedButton(
                onPressed: () {
                  // Acción Botón 1
                  Navigator.pop(context); // Regresa a la pantalla anterior
                },
                child: const Text('volvereishon'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción boton 2
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Va a Explotar!!!!!!')),
                  );
                },
                child: const Text('No se para que sirve este boton'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
