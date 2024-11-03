import 'package:flutter/material.dart';
// Permitir el ingreso de un par de números y determinar si son números amigos.

class NumerosAmigosScreen extends StatefulWidget {
  const NumerosAmigosScreen({super.key});

  @override
  State<NumerosAmigosScreen> createState() => _NumerosAmigosScreenState();
}

class _NumerosAmigosScreenState extends State<NumerosAmigosScreen> {
  int numOne = 0;
  int numTwo = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _sumarDivisores(int num){
    int suma = 0;
    for (int i = 1; i < num; i++) {
      if (num % i == 0) {
        suma += i;
      }
    }
    return suma;
  }

  bool _sonAmigos(int n1, int n2) {
    return _sumarDivisores(n1) == n2 && _sumarDivisores(n2) == n1;
  }

  @override
  Widget build(BuildContext context) {
    const inputDecoration = InputDecoration(
      labelText: 'Ingresa un número',
      border: OutlineInputBorder(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Números amigos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: inputDecoration,
                onChanged: (value) => numOne = int.parse(value),
                validator: (value) {
                  if (value!.isEmpty) return 'Campo requerido';
                  if (int.parse(value) <= 0) return 'Valor debe ser mayor a 0';
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: inputDecoration,
                onChanged: (value) => numTwo = int.parse(value),
                validator: (value) {
                  if (value!.isEmpty) return 'Campo requerido';
                  if (int.parse(value) <= 0) return 'Valor debe ser mayor a 0';
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(_sonAmigos(numOne, numTwo) ? 'Son números amigos' : 'NO son números amigos'),
                        backgroundColor: Colors.blue[700],
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: const Text('VERIFICAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
