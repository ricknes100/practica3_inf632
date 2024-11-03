import 'package:flutter/material.dart';

// Crea una aplicación que permita al usuario ingresar un número entero y conviértelo
// a su representación binaria.
class BinarioScreen extends StatefulWidget {
  const BinarioScreen({super.key});

  @override
  State<BinarioScreen> createState() => _BinarioScreenState();
}

class _BinarioScreenState extends State<BinarioScreen> {
  int inputValue = 0;
  String binary = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _convertirBinario(int num){
    String binario = '';

    while (num > 0){
      binario += "${num%2}";
      num = num ~/ 2;
    }

    return binario.split('').reversed.join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Convertir a binario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Ingresa un número',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => inputValue = int.parse(value),
                validator: (value) {
                  if (value!.isEmpty) return 'Campo requerido';
                  if (int.parse(value) <= 0) return 'Valor debe ser mayor a 0';
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                    setState(() {
                      binary = _convertirBinario(inputValue);
                    });
                }
              },
              child: const Text('CONVERTIR'),
            ),
            const SizedBox(height: 24.0),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.cyan[50],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                binary,
                style: const TextStyle(fontSize: 24.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
