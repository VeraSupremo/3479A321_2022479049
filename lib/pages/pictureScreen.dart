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
      // Verifica que haya cámaras disponibles
      if (widget.cameras.isEmpty) {
        throw Exception('No cameras available');
      }

      // Crea el controlador de la cámara
      _controlador = CameraController(
        widget.cameras[0],
        ResolutionPreset.medium, // Cambiado a medium para mejor calidad
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      // Inicializa el controlador
      _initializeControllerFuture = _controlador.initialize();
      await _initializeControllerFuture;

      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
      }
    } catch (e) {
      print("Error al inicializar la cámara: $e");
      if (mounted) {
        setState(() {
          _isCameraInitialized = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  // para guardar de forma persistente la imagen capturada
  Future<String> _guardarImagen(XFile image) async {
    try {
    final directory = await getApplicationDocumentsDirectory();
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final filePath = path.join(directory.path, 'captured_image.jpg');
    final file = File(filePath);
    await file.writeAsBytes(await image.readAsBytes());
    return filePath;
    } catch (e) {
      print("Error al guardar imagen: $e");
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              Text('Inicializando cámara...',style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      );
      //return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: //CameraPreview(_controlador),
      /*floatingActionButton: FloatingActionButton(
         onPressed: () async {
          final image = await _controlador.takePicture();
          Navigator.pop(context, image.path); // Retorna la ruta de la imagen
        },*/
       /* onPressed: () async {
          XFile? image;
          try {
            await _initializeControllerFuture;
            final image = await _controlador?.takePicture();
          } catch (e) {
            print(e);
          }
          if (image != null) {
            final imagePath = await _guardarImagen(image);
            Navigator.pop(context,imagePath,); // Retorna la ruta de la imagen guardada
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
      ),*/
     Column(
        children: [
          Expanded(
            child: CameraPreview(_controlador),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                onPressed: () async {
                  try {
                    // Asegúrate de que la cámara esté lista
                    if (!_isCameraInitialized) return;
                    
                    final image = await _controlador.takePicture();
                    final imagePath = await _guardarImagen(image);

                    if (!mounted) return;

                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PreviewPictureScreen(imagePath: imagePath),
                      ),
                    );
                  } catch (e) {
                    print("Error al tomar foto: $e");
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error al tomar foto: $e')),
                      );
                    }
                  }
                },
                icon: const Icon(Icons.camera, size: 50, color: Colors.white),
              ),
            ),
          ),
        ],
      )
      /*floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controlador.takePicture();
            final imagePath = await _guardarImagen(image);

            if (!context.mounted) return;

            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PreviewPictureScreen(imagePath: imagePath),
              ),
            );
          } catch (e) {
            print("Error al tomar foto: $e");
          }
        },
        child: Icon(Icons.camera),
      ),*/

    );
  }
}
