import 'package:crypto_converter/core/http/models/request_fail.exception.dart';
import 'package:crypto_converter/features/crypto_comparison/domain/repositories/coins.repository.dart';
import 'package:crypto_converter/features/crypto_comparison/domain/usecases/get_coins_list.usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../data/mock_coin.model.dart';
import 'get_coins_list.usecase_test.mocks.dart';

@GenerateMocks([ICoinsRepository])
void main() {
  late MockICoinsRepository mockCoinsRepository;
  late GetCoinsListUseCase useCase;

  setUpAll(() {
    mockCoinsRepository = MockICoinsRepository();
    useCase = GetCoinsListUseCase(repository: mockCoinsRepository);
  });

  group('GetOriginalUrlUseCase test', () {
    test('Should return Right with List of Coin', () async {
      // arrange
      when(mockCoinsRepository.getCoins())
          .thenAnswer((_) async => const Right(MockCoinModel.coinListMock));
      // act
      final result = await useCase();
      // assert
      verify(mockCoinsRepository.getCoins());

      expect(result, equals(const Right(MockCoinModel.coinListMock)));
      verifyNoMoreInteractions(mockCoinsRepository);
    });

    test('Should return Left with BaseException variant', () async {
      // arrange
      when(mockCoinsRepository.getCoins())
          .thenAnswer((_) async => throw const Left(RequestFailException()));

      try {
        // act
        await useCase();
      } catch (e) {
        // assert
        expect(e, equals(const Left(RequestFailException())));
      }
    });
  });
}
