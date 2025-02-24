import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Image.network(
            'https://picsum.photos/512/1024',
            fit: BoxFit.cover, // Ajuste l'image pour remplir l'écran
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
