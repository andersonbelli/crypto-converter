import 'package:crypto_converter/core/http/http_manager.dart';
import 'package:crypto_converter/core/utils/server_config.dart';
import 'package:crypto_converter/features/crypto_comparison/data/models/coin.model.dart';

abstract class ICoinsListRemoteDataSource {
  Future<List<CoinModel>> getCoinsList();
}

class CoinsListRemoteDataSource extends ICoinsListRemoteDataSource {
  final HttpManager http;

  CoinsListRemoteDataSource(this.http);

  @override
  Future<List<CoinModel>> getCoinsList() async {
    final response = await http.get(ServerConfig.COINS_LIST);

    return (response as List)
        .map((e) => CoinModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
