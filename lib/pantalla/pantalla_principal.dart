import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Necesario para TextInputFormatter
import '../logica/numero_intervalo_logica.dart';

class PantallaPrincipal extends StatefulWidget {
  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  final NumeroIntervaloLogica logica = NumeroIntervaloLogica();
  String resultado = "";
  String errorMessage = "";

  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();

  void mostrarNumero(int numero) {
    setState(() {
      resultado += "$numero ";
    });
  }

  void calcular() {
    setState(() {
      resultado = "";
      errorMessage = "";
    });

    int numero1 = int.tryParse(numero1Controller.text) ?? 0;
    int numero2 = int.tryParse(numero2Controller.text) ?? 0;

    if (numero1 == 0 || numero2 == 0) {
      setState(() {
        errorMessage = "Por favor, ingrese solo números válidos.";
      });
    } else {
      logica.calcularIntervalo(numero1, numero2, mostrarNumero);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Números en un Intervalo', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amber, Colors.deepOrange, Colors.orangeAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.numbers, size: 50, color: Colors.orange),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Introduce dos números para calcular el intervalo',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: numero1Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Primer número',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    errorText: errorMessage.isEmpty ? null : errorMessage,
                  ),
                  style: TextStyle(color: Colors.white),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: numero2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Segundo número',
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    errorText: errorMessage.isEmpty ? null : errorMessage,
                  ),
                  style: TextStyle(color: Colors.white),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: calcular,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Calcular Intervalo',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  resultado,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
