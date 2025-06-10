import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraPage({Key? key, required this.cameras}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controlador;

  @override
  void initState() {
    super.initState();
    _controlador = CameraController(
      widget.cameras[0], // Cámara trasera
      ResolutionPreset.medium,
    );
    _controlador.initialize();
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraPreview(_controlador),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final image = await _controlador.takePicture();
          Navigator.pop(context, image.path); // Retorna la ruta de la imagen
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}