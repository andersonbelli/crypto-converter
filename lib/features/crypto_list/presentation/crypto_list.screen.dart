import 'package:crypto_converter/features/crypto_list/presentation/bloc/crypto_list.bloc.dart';
import 'package:crypto_converter/features/crypto_list/presentation/supported_currencies_list.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CryptoListBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a coin'),
        centerTitle: true,
      ),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is CryptoListLoadedState || state is CryptoSelectedState) {
            return ListView.builder(
              itemCount: bloc.coinsList.length,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(bloc.coinsList[i].name),
                  subtitle: Text(bloc.coinsList[i].symbol),
                  trailing: bloc.coinsList[i] == bloc.selectedCrypto
                      ? const Icon(Icons.check)
                      : const SizedBox.shrink(),
                  onTap: () => bloc.add(
                    SelectCryptoEvent(bloc.coinsList[i]),
                  ),
                );
              },
            );
          } else if (state is CryptoListLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CryptoListErrorState) {
            return Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  'Something went wrong :(\n\n'
                  '${state.errorMessage}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return const Center(child: Text('Nothing to see here'));
        },
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        margin: const EdgeInsets.only(bottom: 24.0),
        child: bloc.selectedCrypto != null
            ? ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: bloc,
                      child: const SupportedCurrenciesList(),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
