import 'package:crypto_converter/features/crypto_compare/presentation/bloc/crypto_list.bloc.dart';
import 'package:crypto_converter/features/crypto_compare/presentation/supported_currencies_list.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsList extends StatelessWidget {
  const CoinsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CryptoListBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a coin'),
        centerTitle: true,
      ),
      body: BlocConsumer<CryptoListBloc, CryptoListState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is SupportedCurrenciesListLoadedState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: bloc,
                  child: const SupportedCurrenciesList(),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is CoinsListLoadedState || state is CoinSelectedState) {
            return ListView.separated(
              itemCount: bloc.coinsList.length,
              shrinkWrap: true,
              separatorBuilder: (context, i) => const Divider(),
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(bloc.coinsList[i].name),
                  subtitle: Text(bloc.coinsList[i].symbol),
                  trailing: bloc.coinsList[i] == bloc.selectedCoin
                      ? const Icon(Icons.check)
                      : const SizedBox.shrink(),
                  onTap: () => bloc.add(
                    SelectCoinEvent(bloc.coinsList[i]),
                  ),
                );
              },
            );
          } else if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
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
        child: bloc.selectedCoin != null
            ? ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  bloc.add(GetSupportedCurrenciesListEvent());
                  bloc.selectedSupportedCurrency = null;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                      )
                    ],
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
