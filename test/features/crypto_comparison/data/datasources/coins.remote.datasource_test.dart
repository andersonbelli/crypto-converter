import 'package:crypto_converter/features/crypto_comparison/data/datasources/coin.remote.datasource.dart';
import 'package:crypto_converter/features/crypto_comparison/data/models/coin.model.dart';
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
    when(coinsDataSource.getCoinList()).thenAnswer(
      (realInvocation) async => MockCoinModel.coinListMock,
    );

    // Act
    final result = await coinsDataSource.getCoinList();

    // Assert
    verify(coinsDataSource.getCoinList()).called(1);
    expect(result, isInstanceOf<List<CoinModel>>());
  });
}
