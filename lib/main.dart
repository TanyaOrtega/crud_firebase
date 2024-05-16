import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantalla App',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        scaffoldBackgroundColor: const Color.fromARGB(0, 245, 242, 242),
        appBarTheme: AppBarTheme(
          color: Colors.pinkAccent.withOpacity(0.8),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: Stack(
        children: [
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Sala_de_cine.jpg/1200px-Sala_de_cine.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Color.fromARGB(194, 255, 255, 255).withOpacity(0.3),
            width: double.infinity,
            height: double.infinity,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('Pantalla App'),
            ),
            body: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.transparent,
              child: HomeScreen(),
            ),
          ),
        ],
      ),
    );
  }
}
