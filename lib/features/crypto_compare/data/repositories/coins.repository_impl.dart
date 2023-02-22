import 'package:crypto_converter/core/http/models/exception_models.dart';
import 'package:crypto_converter/features/crypto_compare/data/datasources/coins.remote.datasource.dart';
import 'package:crypto_converter/features/crypto_compare/data/models/coin.model.dart';
import 'package:crypto_converter/features/crypto_compare/domain/repositories/coins.repository.dart';
import 'package:dartz/dartz.dart';

class CoinsRepository extends ICoinsRepository {
  final ICoinsRemoteDataSource remote;

  CoinsRepository(this.remote);

  @override
  Future<Either<BaseException, List<CoinModel>>> getCoins() async {
    try {
      return Right(await remote.getCoins());
    } on RequestFailException catch (e) {
      return Left(e);
    } on GenericException catch (e) {
      return Left(e);
    }
  }
}
