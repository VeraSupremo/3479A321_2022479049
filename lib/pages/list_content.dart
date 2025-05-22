import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/changeNotifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pages/about.dart';

//Aqui agregar la clase listaContenido extend statelesswidget
class ListaContenido extends StatelessWidget {
  ListaContenido({super.key});

  final List<String> items = [
    'palabra xd',
    'palabra 2',
    'Elemento 1',
    'tungtungtungtung',
    'lirililarila',
    'palabra 5',
    'Tu ere el balatro',
    'Elemento 3',
    'sparalapatikitaka',
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
            color: const Color.fromARGB(255,44,109,53,), //esto es para el color de la tarjeta
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35), // Bordes redondeados
            ),
            elevation: 100,
            margin: const EdgeInsets.fromLTRB(2,58,2,58,), //esto es para mover los bordes de la tarjeta
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Contenido de la lista'),
                const SizedBox(height: 20), // Espacio entre widgets
                Expanded(child: // expanded es para que la lista ocupe el espacio de la card
                  ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(items[index]),
                        onTap: () {
                          // Acción al tocar el elemento de la lista
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Seleccionaste: ${items[index]}')),
                          );
                        },
                      );
                    },
                  )
                ),

              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:<Widget> [
            ElevatedButton(
              onPressed: () {
                // Acción Botón 1
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
              child: const Text('Detalles'),
            ),
          ],
        ),

      ],

    );
  }
}

