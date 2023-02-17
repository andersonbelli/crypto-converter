import 'package:crypto_converter/features/crypto_list/presentation/bloc/crypto_list.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoListBloc, CryptoListState>(
      builder: (context, state) {
        if (state is CryptoListLoadedState) {
          return ListView.builder(
            itemCount: state.coinsList.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(state.coinsList[i].name),
                subtitle: Text(state.coinsList[i].symbol),
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
    );
  }
}
