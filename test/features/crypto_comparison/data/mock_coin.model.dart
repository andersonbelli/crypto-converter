import 'package:crypto_converter/features/crypto_comparison/data/models/coin.model.dart';

abstract class MockCoinModel {
  static const CoinModel coinMock = CoinModel(
    id: '1art',
    name: 'OneArt',
    symbol: '1art',
  );

  static const List<CoinModel> coinListMock = [
    CoinModel(
      id: '1art',
      name: 'OneArt',
      symbol: '1art',
    ),
    CoinModel(
      id: 'acet-token',
      name: 'Acet',
      symbol: 'act',
    ),
    CoinModel(
      id: 'keeps-coin',
      name: 'KEEPs Coin',
      symbol: 'kverse',
    ),
  ];
}
