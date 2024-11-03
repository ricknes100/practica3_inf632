import 'package:flutter/material.dart';

// Permitir el ingreso de una oración y determinar si es o no un palíndromo.

class PalindromoScreen extends StatefulWidget {

  const PalindromoScreen({super.key});

  @override
  State<PalindromoScreen> createState() => _PalindromoScreenState();
}

class _PalindromoScreenState extends State<PalindromoScreen> {

  String inputValue = '';

  bool _esPalindromo(String text) {
    text = text.toLowerCase().replaceAll(' ', '');
    String reverse = text.split('').reversed.join();
    return text == reverse;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Palindromo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Ingresa texto',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => inputValue = value,
                validator: (value) {
                  if (value!.isEmpty) return 'Campo requerido';
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16.0),
            FilledButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(_esPalindromo(inputValue) ? 'Es palindromo': 'NO es palindromo'),
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
    );
  }
}
