import 'package:flutter/material.dart';
import 'package:practica3_inf632/binario_screen.dart';
import 'package:practica3_inf632/numeros_amigos_screen.dart';
import 'package:practica3_inf632/palindromo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Práctica3 INF632',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica 3'),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PalindromoScreen())
              );
            },
            title: const Text('Palíndromo'),
            trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          ),
          ListTile(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NumerosAmigosScreen())
              );
            },
            title: const Text('Números amigos'),
            trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          ),
          ListTile(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BinarioScreen())
              );
            },
            title: const Text('Convertir a binario'),
            trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          )
        ],
      ),
    );
  }
}
