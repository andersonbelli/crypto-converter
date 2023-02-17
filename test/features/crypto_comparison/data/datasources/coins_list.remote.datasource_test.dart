import 'package:crypto_converter/features/crypto_comparison/data/datasources/coins_list.remote.datasource.dart';
import 'package:crypto_converter/features/crypto_comparison/data/models/coin.model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../mock_coin.model.dart';
import 'coins_list.remote.datasource_test.mocks.dart';

@GenerateMocks([ICoinsListRemoteDataSource])
void main() {
  late MockICoinsListRemoteDataSource coinsDataSource;

  setUp(() {
    coinsDataSource = MockICoinsListRemoteDataSource();
  });

  test('Should request getCoinList and verify it returns a list of CoinModel',
      () async {
    // Arrange
    when(coinsDataSource.getCoinsList()).thenAnswer(
      (realInvocation) async => MockCoinModel.coinListMock,
    );

    // Act
    final result = await coinsDataSource.getCoinsList();

    // Assert
    verify(coinsDataSource.getCoinsList()).called(1);
    expect(result, isInstanceOf<List<CoinModel>>());
  });
}
