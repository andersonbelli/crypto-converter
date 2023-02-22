import 'package:crypto_converter/di/base.di.dart';
import 'package:crypto_converter/di/injector.dart';
import 'package:crypto_converter/features/crypto_compare/data/datasources/coins.remote.datasource.dart';
import 'package:crypto_converter/features/crypto_compare/data/datasources/simple.remote.datasource.dart';
import 'package:crypto_converter/features/crypto_compare/data/repositories/coins.repository_impl.dart';
import 'package:crypto_converter/features/crypto_compare/data/repositories/simple.repository_impl.dart';
import 'package:crypto_converter/features/crypto_compare/domain/repositories/coins.repository.dart';
import 'package:crypto_converter/features/crypto_compare/domain/repositories/simple.repository.dart';
import 'package:crypto_converter/features/crypto_compare/domain/usecases/get_coins_list.usecase.dart';
import 'package:crypto_converter/features/crypto_compare/domain/usecases/get_simple_price.usecase.dart';
import 'package:crypto_converter/features/crypto_compare/domain/usecases/get_supported_currencies_list.usecase.dart';
import 'package:crypto_converter/features/crypto_compare/presentation/bloc/crypto_list.bloc.dart';

class CoinListDI implements BaseDI {
  @override
  void registerAll() {
    final di = Injector.di;

    /// Datasource
    di.registerFactory<ICoinsRemoteDataSource>(
      () => CoinsRemoteDataSource(
        http: di(),
      ),
    );
    di.registerFactory<ISimpleRemoteDataSource>(
      () => SimpleRemoteDataSource(
        http: di(),
      ),
    );

    /// Repositories
    di.registerFactory<ICoinsRepository>(
      () => CoinsRepository(di()),
    );
    di.registerFactory<ISimpleRepository>(
      () => SimpleRepository(di()),
    );

    /// UseCases
    di.registerFactory<IGetCoinsListUseCase>(
      () => GetCoinsListUseCase(repository: di()),
    );
    di.registerFactory<IGetSupportedCurrenciesUseCase>(
      () => GetSupportedCurrenciesUseCase(repository: di()),
    );
    di.registerFactory<IGetSimplePriceUseCase>(
      () => GetSimplePriceUseCase(repository: di()),
    );

    /// Bloc
    di.registerFactory<CryptoListBloc>(
      () => CryptoListBloc(
        getCoinsListUseCase: di(),
        getSupportedCurrenciesUseCase: di(),
        getSimplePriceUseCase: di(),
      ),
    );
  }
}
