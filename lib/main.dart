import 'dart:math';
import 'package:flutter/material.dart'; //Importación en Dart,permite acceder a todos estos widgets y funcionalidades proporcionados por el paquete

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              'Colores', // Título de la aplicación.
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold), // Estilo del Titulo
            ),
            ColorChangeWidget(
              initialColor: Color.fromARGB(255, 245, 1, 172), //color inicial
            ),
          ],
        ),
      ),
    );
  }
}

class ColorChangeWidget extends StatefulWidget {
  //Es un StatefulWidget que fue creado para cambiar de color cuando el usuario le de click.
  final Color initialColor;

  const ColorChangeWidget({Key? key, required this.initialColor})
      : super(key: key);

  @override
  _ColorChangeWidgetState createState() => _ColorChangeWidgetState();
}

class _ColorChangeWidgetState extends State<ColorChangeWidget> {
  late Color _color;

  @override
  void initState() {
    super.initState();
    _color = widget
        .initialColor; //Es el color inicial del contenedor antes de que el usuario le de click
  }

  Color _generateRandomColor() {
    // aqui se generara un color aleatorio, a diferencia del anterior que solo admitia 2
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Este ayuda a detectar cuando el usuario esta precionando del contenedor para asi por cambiar de color
    return GestureDetector(
      onTap: () {
        setState(() {
          _color =
              _generateRandomColor(); // Cambiar el color aleatorio cuando se de click
        });
      },
      child: Container(
        width: 500,
        height: 300,
        color: _color, // Color del contenedor
        child: const Center(
          // Centro del contenedor
          child: Text(
            'Toca aquí',
            style: TextStyle(
                color: Color.fromARGB(255, 3, 253, 241),
                fontSize: 18.0), //color del texto
          ),
        ),
      ),
    );
  }
}
