import 'package:crypto_converter/di/injector.dart';
import 'package:crypto_converter/features/crypto_compare/presentation/bloc/crypto_list.bloc.dart';
import 'package:crypto_converter/features/crypto_compare/presentation/coins_list.screen.dart';
import 'package:crypto_converter/features/crypto_compare/presentation/widget/compare_coin_item.dart';
import 'package:crypto_converter/features/crypto_compare/presentation/widget/compare_coin_vs_currency.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CompareCoinsScreen extends StatelessWidget {
  const CompareCoinsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<CryptoListBloc>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => bloc.add(CompareCoinsEvent()),
          ),
        ],
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.amberAccent,
        ),
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  contentPadding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.all(24),
                          child: Text(
                            'Back to home screen?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Theme.of(context).primaryColor,
                                  ),
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(6),
                                    ),
                                  ),
                                  height: 45,
                                  child: const Center(
                                    child: Text(
                                      'NO',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  bloc.add(ResetEvent());

                                  Navigator.popUntil(
                                    context,
                                    (route) => route.isFirst,
                                  );

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                        create: (_) =>
                                            Injector.di<CryptoListBloc>(),
                                        child: const CoinsList(),
                                      ),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Theme.of(context).indicatorColor,
                                  ),
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(6),
                                    ),
                                  ),
                                  height: 45,
                                  child: const Center(
                                    child: Text(
                                      'YES',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
            return Future.value(true);
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is ComparePricesState) {
                final timeStamp = DateTime.fromMillisecondsSinceEpoch(
                  (state.compareCoin.lastUpdatedAt ?? 0) * 1000,
                );
                final dateTimeStamp =
                    DateFormat('dd/MM/yyyy HH:mm').format(timeStamp);
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      CompareCoinVsCurrency(
                        selectedCoin: bloc.selectedCoin?.name ?? '',
                        selectedCurrency: bloc.selectedSupportedCurrency != null
                            ? '${bloc.selectedSupportedCurrency?.name.toUpperCase()}'
                            : '[Select a coin]',
                      ),
                      CompareCoinItem(
                        title: state.compareCoin.currencyTag,
                        value: state.compareCoin.coinValue.toString(),
                      ),
                      CompareCoinItem(
                        title: '${state.compareCoin.currencyTag} market cap',
                        value: state.compareCoin.coinMarketCap.toString(),
                      ),
                      CompareCoinItem(
                        title:
                            '${state.compareCoin.currencyTag} vol in last 24h',
                        value: state.compareCoin.coin24hVol == null
                            ? 'No data'
                            : state.compareCoin.coin24hVol.toString(),
                      ),
                      CompareCoinItem(
                        title:
                            '${state.compareCoin.currencyTag} change in last 24h',
                        value: state.compareCoin.coin24hChange.toString(),
                      ),
                      CompareCoinItem(
                        title: 'last updated at',
                        value: dateTimeStamp,
                      ),
                    ],
                  ),
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
      ),
    );
  }
}
