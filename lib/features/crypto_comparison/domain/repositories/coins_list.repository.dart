import 'package:crypto_converter/core/http/models/exception_models.dart';
import 'package:crypto_converter/features/crypto_comparison/data/models/coin.model.dart';
import 'package:dartz/dartz.dart';

abstract class ICoinsListRepository {
  Future<Either<BaseException, List<CoinModel>>> getCoinsList();
}
