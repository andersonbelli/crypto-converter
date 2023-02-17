import 'package:crypto_converter/core/http/models/exception_models.dart';
import 'package:crypto_converter/features/crypto_comparison/domain/entities/coin.entity.dart';
import 'package:dartz/dartz.dart';

abstract class ICoinsRepository {
  Future<Either<BaseException, List<Coin>>> getCoins();
}
