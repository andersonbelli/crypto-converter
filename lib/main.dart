import 'package:crypto_converter/di/core.di.dart';
import 'package:crypto_converter/di/injector.dart';
import 'package:crypto_converter/features/crypto_list/presentation/bloc/crypto_list.bloc.dart';
import 'package:crypto_converter/features/crypto_list/presentation/crypto_list.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: BlocProvider(
        create: (context) => Injector.di<CryptoListBloc>(),
        child: const CryptoList(),
      ),
    );
  }
}
