import 'package:crypto_converter/di/core.di.dart';
import 'package:flutter/material.dart';

void main() async {
  CoreDI().registerAll();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Converter',
      theme: ThemeData(brightness: Brightness.dark),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cryptos :)'),
      ),
      body: const Center(
        child: Text('Under Construction...'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
