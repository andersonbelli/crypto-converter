import 'package:crypto_converter/core/http/models/exception_models.dart';
import 'package:crypto_converter/features/crypto_compare/data/datasources/simple.remote.datasource.dart';
import 'package:crypto_converter/features/crypto_compare/data/models/supported_currency.model.dart';
import 'package:crypto_converter/features/crypto_compare/domain/entities/simple_price.entity.dart';
import 'package:crypto_converter/features/crypto_compare/domain/repositories/simple.repository.dart';
import 'package:dartz/dartz.dart';

class SimpleRepository extends ISimpleRepository {
  final ISimpleRemoteDataSource remote;

  SimpleRepository(this.remote);

  @override
  Future<Either<BaseException, List<SupportedCurrencyModel>>>
      getSupportedCurrencies() async {
    try {
      return Right(await remote.getSupportedCurrencies());
    } on RequestFailException catch (e) {
      return Left(e);
    } on GenericException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<BaseException, SimplePrice>> getSimplePrice(
    String coinId,
    String currencyName,
  ) async {
    try {
      return Right(
        await remote.getSimplePrice(
          coinId: coinId,
          currencyName: currencyName,
        ),
      );
    } on RequestFailException catch (e) {
      return Left(e);
    } on GenericException catch (e) {
      return Left(e);
    }
  }
}
