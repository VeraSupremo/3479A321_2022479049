import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/changeNotifier.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pages/list_content.dart';
import 'package:flutter_application_1/pages/about.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/pages/preferencias.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}
// crear la clase homestate

class _MyHomePageState extends State<MyHomePage> {
  @override
  bool posibleresetBool = false; //esto es para el boton de resetear el contador, si es par o impar se cambia la cosa de reset
  _MyHomePageState() {
    //print("Lirililarila");
    print("$mounted");
  }

  @override
  void initState() {
    super.initState(); //se crea la funcion que inicializa un widget por 1 vez
    _loadPreferences();
    print('Widget inicializado');
    // Aquí puedes inicializar controladores, hacer llamadas API iniciales, etc.
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      posibleresetBool = prefs.getBool('isResetEnabled') ?? false;
      print("Cargando preferencias: ");
      //context.read<AppData>().posibleresetBool = posibleresetBool;
    });
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListaContenido()),
      );
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
    }
  }

  @override
  Widget build(BuildContext context) {
    print("BuildBuild");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        //añadir a listview al drawer. Esto asegura que el usuario pueda desplazarse
        //a través de las opciones en el cajón si no hay suficiente espacio vertical
        // para encajar todo.
        // El Drawer es un widget que se desliza desde el lado de la pantalla
        backgroundColor: Color.fromARGB(255, 246, 252, 246),
        child: ListView(
          // Importante: eliminar cualquier relleno de la ListView
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 0,
                right: 0,
                top: 22,
                bottom: 22,
              ),

              //padding: const EdgeInsets.all(4.2),
              child: const DrawerHeader(
                // Encabezado del menú lateral
                // decoration:PictureLayer.network('https://live.staticflickr.com/65535/53752621454_c14ecc01ec_b'),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://www.reforestemos.org/content/uploads/bosque-nativo-araucaria-2.jpg',
                    ),
                    fit:
                        BoxFit
                            .cover, // Ajusta la imagen para cubrir el contenedor
                  ),
                  color: Color.fromARGB(255, 190, 238, 144),
                  // borderRadius: BorderRadius.circular(10), // Bordes redondeados
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      //backgroundImage: AssetImage('assets/pictures/p1.jpg'),
                      backgroundImage: NetworkImage(
                        'https://www.reforestemos.org/content/uploads/bosque-nativo-araucaria-2.jpg',
                      ),
                    ),
                    SizedBox(height: 5), // Espacio entre el avatar y el texto

                    Text(
                      ' ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            ListTile(
              // de aqui en adelante son los elementos del menu lateral
              leading: const Icon(Icons.home_work_outlined),
              title: const Text('Inicio'),
              onTap: () {
                // Actualiza el estado de la aplicación
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_2_outlined),
              title: const Text('Info extra'),
              onTap: () {
                // Update the state of the app
                //_onItemTapped(1);//------------------------------------------------------poner navegator push
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Sobre()),
                );
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.store),
              title: const Text('Lista Contenido'),
              onTap: () {
                // Update the state of the app
                // _onItemTapped(2);//------------------------------------------------------poner navegator push
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListaContenido()),
                );
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Preferencias'),
              onTap: () {
                // Update the state of the app
                // _onItemTapped(2);//------------------------------------------------------poner navegator push
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Preferencias()),
                ).then((_) {
                  _loadPreferences(); // Recargar preferencias al volver
                });
                // Then close the drawer
                //Navigator.pop(context);
              },
            ),
          ],
        ),
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
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceAround, //el spacearoun va ordenando los botonsitos
                children: <Widget>[
                  ElevatedButton(
                    onPressed: context.read<AppData>().decrementCounter,
                    child: const Icon(Icons.exposure_minus_1),
                  ),
                  if (posibleresetBool == true)
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

              ElevatedButton(
                onPressed: paronopar,
                child: const Text(
                  'Boton misterioso',
                  style: TextStyle(color: Color.fromARGB(255, 96, 27, 224)),
                ),
              ),
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
