part of 'crypto_list.bloc.dart';

@immutable
abstract class CryptoListEvent {}

class GetCryptoListEvent extends CryptoListEvent {}

class SelectCoinEvent extends CryptoListEvent {
  final Coin selectedCoin;

  SelectCoinEvent(this.selectedCoin);
}

class SelectSupportedCurrencyEvent extends CryptoListEvent {
  final SupportedCurrency selectedSupportedCurrency;

  SelectSupportedCurrencyEvent(this.selectedSupportedCurrency);
}

class GetSupportedCurrenciesListEvent extends CryptoListEvent {}

class CompareCoinsEvent extends CryptoListEvent {}

class ResetEvent extends CryptoListEvent {}
