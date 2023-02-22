import 'package:crypto_converter/core/http/http_impl.dart';
import 'package:crypto_converter/core/http/http_manager.dart';
import 'package:crypto_converter/di/base.di.dart';
import 'package:crypto_converter/di/injector.dart';
import 'package:crypto_converter/features/crypto_compare/di/coin.di.dart';

class CoreDI implements BaseDI {
  @override
  void registerAll() {
    /// Http
    Injector.di.registerFactory<HttpManager>(
      () => HttpImpl(),
    );

    /// Features DI
    // Coin
    CoinListDI().registerAll();
  }
}
