import 'package:flutter/material.dart';
import 'carica_immagine.dart';

class Aggiungi_Amici extends StatefulWidget {
  @override
  _Aggiungi_AmiciState createState() => _Aggiungi_AmiciState();
}

class _Aggiungi_AmiciState extends State<Aggiungi_Amici> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primaryColor: Colors.blue[300],
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.blue[300],
        brightness: Brightness.dark,
      ),
      home: ImageCapture(),
    );
  }
}
