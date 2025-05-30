import 'package:flutter/material.dart';
import 'package:flutter_application_1/entidades/actividad.dart';
import '../servicios/database_helper.dart';
class ActividadesPage extends StatefulWidget {
  const ActividadesPage({super.key});
  
  @override
  State<ActividadesPage> createState() {
    return ActividadesPageState();
  }
  
  
}
class ActividadesPageState extends State<ActividadesPage> {
  
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Actividad> _activities = [];

 @override
  void initState() {
    super.initState();
    // Aquí puedes inicializar cualquier cosa que necesites
    print("ActividadesPage initialized");
  }
  
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividades'),
      ),
      body: Center(
        child: Text(
          'Actividades Page',
          style: TextStyle(fontSize: 24,color: Color.fromARGB(230, 69, 231, 131),),
        ),

      ),
    );
  }
}