import 'package:crypto_converter/features/crypto_list/data/datasources/coins.remote.datasource.dart';
import 'package:crypto_converter/features/crypto_list/data/models/coin.model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../mock_coin.model.dart';
import 'coins.remote.datasource_test.mocks.dart';

@GenerateMocks([ICoinsRemoteDataSource])
void main() {
  late MockICoinsRemoteDataSource coinsDataSource;

  setUp(() {
    coinsDataSource = MockICoinsRemoteDataSource();
  });

  test('Should request getCoinList and verify it returns a list of CoinModel',
      () async {
    // Arrange
    when(coinsDataSource.getCoins()).thenAnswer(
      (realInvocation) async => MockCoinModel.coinListMock,
    );

    // Act
    final result = await coinsDataSource.getCoins();

    // Assert
    verify(coinsDataSource.getCoins()).called(1);
    expect(result, isInstanceOf<List<CoinModel>>());
  });
}
