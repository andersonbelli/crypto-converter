import 'package:crypto_converter/core/http/models/exception_models.dart';
import 'package:crypto_converter/features/crypto_comparison/data/datasources/coins_list.remote.datasource.dart';
import 'package:crypto_converter/features/crypto_comparison/data/models/coin.model.dart';
import 'package:crypto_converter/features/crypto_comparison/domain/repositories/coins_list.repository.dart';
import 'package:dartz/dartz.dart';

class CoinsListRepository extends ICoinsListRepository {
  final ICoinsListRemoteDataSource remote;

  CoinsListRepository(this.remote);

  @override
  Future<Either<BaseException, List<CoinModel>>> getCoinsList() async {
    try {
      return Right(await remote.getCoinsList());
    } on RequestFailException catch (e) {
      return Left(e);
    } on GenericException catch (e) {
      return Left(e);
    }
  }
}
