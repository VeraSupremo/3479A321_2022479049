import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/preferencias.dart';
  import 'package:flutter_application_1/provider/changeNotifier.dart';
  import 'package:provider/provider.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles')),
      body: Center(
        child: Card(
          color: const Color.fromARGB(255,146,255,119,), //esto es para el color de la tarjeta
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
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'oli >.< ingresa tu nombre de usuario ^w^',
                ),
                onChanged:
                    (value) => context.read<AppData>().nombreUsuario = value,
              ),

              Text(
                '${context.watch<AppData>().counter}',
                style: TextStyle(
                  fontSize: 70,
                  color: Color.fromARGB(185, 0, 0, 0),
                ),
              ),
              const Text('Sobre esto:'),
              const Text(
                'La Pestaña es un proyecto de prueba para aprender Flutter y Dart.',
              ),
              const Text('Creado por: [Martin Vera]'),
              const Text(
                'Si esto no es un proyecto de prueba, entonces no se que es.',
              ),
              const SizedBox(height: 20), // Espacio entre widgets
              //Preferencias(title: 'Pref',),
               // Botón para ir a la pantalla de preferencias             
              // Botón para ir a la pantalla de preferencias
             
          ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Acción boton 2
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Va a Explotar!!!!!!')),
                );
              },
              child: const Text('No se para que sirve este boton'),
            ),
            ElevatedButton(
              onPressed: () {
                // Acción Botón 1
                Navigator.pop(context); // Regresa a la pantalla anterior
              },
              child: const Text('Volver'),
            ),
          ],
        ),
      ],
    );
  }
}
