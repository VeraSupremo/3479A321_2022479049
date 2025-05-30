class Actividad {
  // Puedes agregar propiedades aquí, por ejemplo:
  String nombre;
  DateTime fecha;
  int id;

  // Constructor
  Actividad({required this.nombre, required this.fecha, required this.id});
  // Método para convertir a un mapa (para almacenamiento o envío)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'fecha': fecha.toIso8601String(), // Convertir DateTime a String
    };
  }

  // Método para crear una instancia desde un mapa
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nombre = map['nombre'];
    fecha = DateTime.parse(map['fecha']); // Convertir String a DateTime
  }
}
