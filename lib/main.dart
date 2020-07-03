import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'primeira.dart';

// adicionar musica

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PrimeiraPage(),
    );

}
}