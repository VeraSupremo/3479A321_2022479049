import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '/entidades/PreviewPictureScreen.dart'; // Asegúrate de que la ruta sea correcta
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraPage({Key? key, required this.cameras}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
  
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controlador;
  bool _isCameraInitialized = false;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      await _controlador.initialize(); // Inicializa el controlador de la cámara
      _controlador = CameraController(
        widget.cameras[0],
        ResolutionPreset.low,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      ); // Selecciona primera cámara disponible y Establece resolución
      setState(
        () => _isCameraInitialized = true,
      ); // Actualiza el estado para indicar que la cámara está inicializada
      _initializeControllerFuture =
          _controlador
              .initialize(); // Asigna la inicialización del controlador a una variable futura
    } catch (e) {
      // Manejo de errores al inicializar la cámara
      print("Error al inicializar la cámara: $e");
    }
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  // para guardar de forma persistente la imagen capturada
  Future<String> _guardarImagen(XFile image) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = path.join(directory.path, 'captured_image.jpg');
    final file = File(filePath);
    await file.writeAsBytes(await image.readAsBytes());
    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraPreview(_controlador),
      floatingActionButton: FloatingActionButton(
        /* onPressed: () async {
          final image = await _controlador.takePicture();
          Navigator.pop(context, image.path); // Retorna la ruta de la imagen
        },*/
        onPressed: () async {
          XFile? image;
          try {
            await _initializeControllerFuture;
            final image = await _controlador.takePicture();
          } catch (e) {
            print(e);
          }
          if (image != null) {
            final imagePath = await _guardarImagen(image);
            Navigator.pop(
              context,
              imagePath,
            ); // Retorna la ruta de la imagen guardada
          }
          //metodo para Previzualizacion de la imagen
          if (!context.mounted) return;
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PreviewPictureScreen(imagePath: image!.path),
            ),
          );
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
