import 'package:crypto_converter/di/base.di.dart';
import 'package:crypto_converter/di/injector.dart';
import 'package:crypto_converter/features/crypto_comparison/data/datasources/coins.remote.datasource.dart';
import 'package:crypto_converter/features/crypto_comparison/data/repositories/coins.repository_impl.dart';
import 'package:crypto_converter/features/crypto_comparison/domain/repositories/coins.repository.dart';
import 'package:crypto_converter/features/crypto_comparison/domain/usecases/get_coins_list.use_case.dart';

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

    /// Repositories
    di.registerFactory<ICoinsRepository>(
      () => CoinsRepository(di()),
    );

    /// UseCases
    di.registerFactory<IGetCoinsListUseCase>(
      () => GetCoinsListUseCase(di()),
    );
  }
}
