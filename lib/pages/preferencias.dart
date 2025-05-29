import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/changeNotifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/pages/about.dart';
import 'package:flutter_application_1/pages/list_content.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferencias extends StatefulWidget {
  const Preferencias({super.key, required this.title});

  final String title;

  @override
  State<Preferencias> createState() {
    return _PrefState();
  }
}

class _PrefState extends State<Preferencias> {
  bool posibleresetBool = false; //esto es para el boton de resetear el contador, si es par o impar se cambia la cosa de reset
  @override
  void initState() {
    super.initState();
    print("Initstate");
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      posibleresetBool = prefs.getBool('isResetEnabled') ?? false;
      print("Cargando preferencias: $posibleresetBool");
      // Actualizar el valor en el Provider si es necesario
      context.read<AppData>().posibleresetBool = posibleresetBool;
    });
  }

  // Método para guardar preferencias
  Future<void> _savePreferences(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    print("Guardando preferencias: $value");
    await prefs.setBool('posibleresetBool', value);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Preferencias")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Llave Magica'),
            const SizedBox(height: 20), // Espacio entre widgets
            Switch(
              value: posibleresetBool,
              onChanged: (value) {
                setState(() {
                  posibleresetBool = value;
                  context.read<AppData>().posiblereset = value; // Actualizar el valor en el Provider
                  _savePreferences(value);
                });
                print("Switch cambiado: $value");
                _savePreferences(value); // Guardar el valor en SharedPreferences
              },
            ),
          ],
        ),
      ),
    );
  }
}
