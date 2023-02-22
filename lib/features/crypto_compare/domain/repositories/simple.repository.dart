import 'package:crypto_converter/core/http/models/exception_models.dart';
import 'package:crypto_converter/features/crypto_compare/domain/entities/simple_price.entity.dart';
import 'package:crypto_converter/features/crypto_compare/domain/entities/supported_currency.entity.dart';
import 'package:dartz/dartz.dart';

abstract class ISimpleRepository {
  Future<Either<BaseException, List<SupportedCurrency>>>
      getSupportedCurrencies();

  Future<Either<BaseException, SimplePrice>> getSimplePrice(
    String coinId,
    String currencyName,
  );
}
