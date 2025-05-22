import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/changeNotifier.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pages/list_content.dart';
import 'package:flutter_application_1/pages/about.dart';

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

  void paronopar() {
    if (context.read<AppData>().counter % 2 == 0) {
      Navigator.push(context, MaterialPageRoute(builder:(context) => ListaContenido()));
    } else{
      Navigator.push(context, MaterialPageRoute(builder:(context) => Sobre()));
    }
  }

  /*int _counter = 0;
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
*/
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
              Text('Oli >.< ${context.watch<AppData>().nombreUsuario}'),
              const Text('Flutter es genial!!!!!!!!...creo'),
              const Text('Dart es genial...(pero no tanto)'),
              SvgPicture.asset(
                'assets/icons/atari.svg',
                semanticsLabel: 'Dart Logo',
              ),
              const Text('Presiona el boton artas veces:'),
              Text(
                '${context.watch<AppData>().counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              //aqui el row pone los botones en horizontal y no en vertical
              //se puede poner row
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround, //el spacearoun va ordenando los botonsitos
                children: <Widget>[
                  ElevatedButton(
                    onPressed: context.read<AppData>().decrementCounter,
                    child: const Icon(Icons.exposure_minus_1),
                  ),
                  if(context.read<AppData>().posibleresetBool )
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

              Text(
                context.read<AppData>().counter > 0
                    ? 'Numeros positivitos'
                    : 'Numeros negativitos',
                style: TextStyle(
                  color:
                      context.read<AppData>().counter > 0
                          ? Colors.green
                          : Colors.yellowAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20), // Espacio entre widgets

              ElevatedButton(onPressed: paronopar, child: const Text('Boton misterioso',style: TextStyle(color: Color.fromARGB(255, 96, 27, 224)),)),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListaContenido()),
                );
              },
              child: const Text('Llendo a otra pagina lista'),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> get botoncitosPersistentes {
    return [
      TextButton(
        onPressed: context.read<AppData>().decrementCounter,
        child: const Icon(Icons.exposure_minus_1),
      ),
      TextButton(
        onPressed: context.read<AppData>().resetCounter,
        child: const Icon(Icons.restart_alt),
      ),
      TextButton(
        onPressed: context.read<AppData>().incrementCounter,

        child: const Icon(Icons.exposure_plus_1),
      ),
    ];
  }
}
