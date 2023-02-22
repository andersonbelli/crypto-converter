import 'package:crypto_converter/core/http/models/exception_models.dart';
import 'package:crypto_converter/features/crypto_compare/domain/entities/supported_currency.entity.dart';
import 'package:crypto_converter/features/crypto_compare/domain/repositories/simple.repository.dart';
import 'package:dartz/dartz.dart';

abstract class IGetSupportedCurrenciesUseCase {
  Future<Either<BaseException, List<SupportedCurrency>>> call();
}

class GetSupportedCurrenciesUseCase extends IGetSupportedCurrenciesUseCase {
  final ISimpleRepository repository;

  GetSupportedCurrenciesUseCase({required this.repository});

  @override
  Future<Either<BaseException, List<SupportedCurrency>>> call() =>
      repository.getSupportedCurrencies();
}
