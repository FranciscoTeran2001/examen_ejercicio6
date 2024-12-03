import 'package:flutter/material.dart';
import 'pantalla/pantalla_principal.dart';

void main() {
  runApp(NumberIntervalApp());
}

class NumberIntervalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intervalo de Números',
      theme: ThemeData(primarySwatch: Colors.red),
      home: PantallaPrincipal(),
    );
  }
}
