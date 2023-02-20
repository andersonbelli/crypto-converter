part of 'crypto_list.bloc.dart';

@immutable
abstract class CryptoListState {}

class CryptoListInitialState extends CryptoListState {}

class CryptoListLoadingState extends CryptoListState {}

class CryptoListLoadedState extends CryptoListState {}

class CryptoSelectedState extends CryptoListState {}

class CryptoListErrorState extends CryptoListState {
  final String errorMessage;

  CryptoListErrorState({required this.errorMessage});
}
