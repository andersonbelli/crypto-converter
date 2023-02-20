part of 'crypto_list.bloc.dart';

@immutable
abstract class CryptoListEvent {}

class GetCryptoListEvent extends CryptoListEvent {}

class SelectCryptoEvent extends CryptoListEvent {
  final Coin selectedCrypto;

  SelectCryptoEvent(this.selectedCrypto);
}
