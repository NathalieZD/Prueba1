import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {// En este apartado se retorna un GestureDetector que da la instruccion de cambiar el color del contenedor cuando el usuario le da click.
    return const MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              'Colores',// el titulo de la aplicacion.
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),// estilo de texto 
            ),
            ColorChangeWidget(
                initialColor: Color.fromARGB(255, 245, 1, 172)), //Es el color inicial del contenedor antes de que el usuario le de click. 
          ],
        ),
      ),
    );
  }
}

class ColorChangeWidget extends StatefulWidget {//Es un StatefulWidget que fue creado para cambiar de color cuando el usuario le de click.
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
    _color = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(//Este ayuda a detectar cuando el usuario esta precionando del contenedor para asi por cambiar de color
      onTap: () {
        setState(() {
          _color = _color == Color.fromARGB(255, 245, 1, 172)
              ? Color.fromARGB(255, 203, 3, 243)
              : Color.fromARGB(255, 245, 1, 172);
        });
      },
      child: Container(
        width: 500,//tamaño del contenedor
        height: 300,
        color: _color,
        child: const Center(
          child: Text(
            'Toca aqui',// Texto del contenedor
            style: TextStyle(
                color: Color.fromARGB(255, 3, 253, 241), fontSize: 18.0),//color del texto
          ),
        ),
      ),
    );
  }
}
