import 'package:crypto_converter/features/crypto_compare/presentation/bloc/crypto_list.bloc.dart';
import 'package:crypto_converter/features/crypto_compare/presentation/compare_coins.screen.dart';
import 'package:crypto_converter/features/crypto_compare/presentation/widget/compare_coin_vs_currency.widget.dart';
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
      body: WillPopScope(
        onWillPop: () async {
          bloc.add(ResetEvent());
          return Future.value(true);
        },
        child: BlocConsumer<CryptoListBloc, CryptoListState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is ComparePricesState) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: bloc,
                    child: const CompareCoinsScreen(),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is SupportedCurrenciesListLoadedState ||
                state is SupportedCurrencySelectedState) {
              return Column(
                children: [
                  CompareCoinVsCurrency(
                    selectedCoin: bloc.selectedCoin?.name ?? '',
                    selectedCurrency: bloc.selectedSupportedCurrency != null
                        ? '${bloc.selectedSupportedCurrency?.name.toUpperCase()}'
                        : '[Select a coin]',
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: bloc.supportedCurrenciesList.length,
                      shrinkWrap: true,
                      separatorBuilder: (context, i) => const Divider(),
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(
                            bloc.supportedCurrenciesList[i].name.toUpperCase(),
                          ),
                          trailing: bloc.supportedCurrenciesList[i] ==
                                  bloc.selectedSupportedCurrency
                              ? const Icon(Icons.check)
                              : const SizedBox.shrink(),
                          onTap: () => bloc.add(
                            SelectSupportedCurrencyEvent(
                              bloc.supportedCurrenciesList[i],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
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
      ),
      bottomNavigationBar: bloc.selectedSupportedCurrency != null
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              margin: const EdgeInsets.only(bottom: 24.0),
              child: ElevatedButton(
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
                onPressed: () => bloc.add(CompareCoinsEvent()),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Compare coins',
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
              ),
            )
          : null,
    );
  }
}
