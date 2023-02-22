part of 'crypto_list.bloc.dart';

@immutable
abstract class CryptoListState {}

class InitialState extends CryptoListState {}

class LoadingState extends CryptoListState {}

class CoinsListLoadedState extends CryptoListState {}

class CoinSelectedState extends CryptoListState {}

class SupportedCurrenciesListLoadedState extends CryptoListState {}

class SupportedCurrencySelectedState extends CryptoListState {}

class ComparePricesState extends CryptoListState {
  final SimplePrice compareCoin;

  ComparePricesState({required this.compareCoin});
}

class ErrorState extends CryptoListState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}
