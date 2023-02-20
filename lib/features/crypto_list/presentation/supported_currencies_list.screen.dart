import 'package:crypto_converter/features/crypto_list/presentation/bloc/crypto_list.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupportedCurrenciesList extends StatelessWidget {
  const SupportedCurrenciesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CryptoListBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Now select a crypto to compare'),
        iconTheme: const IconThemeData(
          color: Colors.amberAccent,
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white70,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black87,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '${bloc.selectedCrypto?.name}',
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const TextSpan(
                    text: '  ❌  ',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const TextSpan(
                    text: '[Select a coin]',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text('Crypto placeholder'),
                );
              },
              itemCount: 25,
            ),
          ),
        ],
      ),
    );
  }
}
