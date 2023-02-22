import 'package:crypto_converter/core/http/models/exception_models.dart';
import 'package:crypto_converter/features/crypto_compare/domain/entities/simple_price.entity.dart';
import 'package:crypto_converter/features/crypto_compare/domain/repositories/simple.repository.dart';
import 'package:dartz/dartz.dart';

abstract class IGetSimplePriceUseCase {
  Future<Either<BaseException, SimplePrice>> call({
    required String coinId,
    required String currencyName,
  });
}

class GetSimplePriceUseCase extends IGetSimplePriceUseCase {
  final ISimpleRepository repository;

  GetSimplePriceUseCase({required this.repository});

  @override
  Future<Either<BaseException, SimplePrice>> call({
    required String coinId,
    required String currencyName,
  }) =>
      repository.getSimplePrice(
        coinId,
        currencyName,
      );
}
