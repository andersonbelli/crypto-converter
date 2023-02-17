import 'package:crypto_converter/core/http/models/exception_models.dart';
import 'package:crypto_converter/features/crypto_comparison/domain/entities/coin.entity.dart';
import 'package:crypto_converter/features/crypto_comparison/domain/repositories/coins.repository.dart';
import 'package:dartz/dartz.dart';

abstract class IGetCoinsListUseCase {
  Future<Either<BaseException, List<Coin>>> call();
}

class GetCoinsListUseCase extends IGetCoinsListUseCase {
  final ICoinsRepository repository;

  GetCoinsListUseCase(this.repository);

  @override
  Future<Either<BaseException, List<Coin>>> call() => repository.getCoins();
}
