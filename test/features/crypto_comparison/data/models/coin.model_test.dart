import 'package:crypto_converter/features/crypto_list/data/models/coin.model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_coin.model.dart';

void main() {
  final response = MockCoinModel.coinMock.toJson();

  group('CoinModel test', () {
    test('CoinModel parse test', () async {
      expect(CoinModel.fromJson(response), isA<CoinModel>());
    });

    test('CoinModel symbol have value of "1art" and is an String', () async {
      expect(CoinModel.fromJson(response).symbol, '1art');
      expect(CoinModel.fromJson(response).symbol, isA<String>());
    });

    test('CoinModel name have value of "OneArt" and is an String', () async {
      expect(CoinModel.fromJson(response).name, 'OneArt');
      expect(CoinModel.fromJson(response).name, isA<String>());
    });
  });
}
