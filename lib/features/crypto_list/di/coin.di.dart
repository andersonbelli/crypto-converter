import 'package:crypto_converter/di/base.di.dart';
import 'package:crypto_converter/di/injector.dart';
import 'package:crypto_converter/features/crypto_list/data/datasources/coins.remote.datasource.dart';
import 'package:crypto_converter/features/crypto_list/data/repositories/coins.repository_impl.dart';
import 'package:crypto_converter/features/crypto_list/domain/repositories/coins.repository.dart';
import 'package:crypto_converter/features/crypto_list/domain/usecases/get_coins_list.usecase.dart';
import 'package:crypto_converter/features/crypto_list/presentation/bloc/crypto_list.bloc.dart';

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
      () => GetCoinsListUseCase(repository: di()),
    );

    /// Bloc
    di.registerFactory<CryptoListBloc>(
      () => CryptoListBloc(getCoinsListUseCase: di()),
    );
  }
}
