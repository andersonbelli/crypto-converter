import 'package:crypto_converter/core/http/http_manager.dart';
import 'package:crypto_converter/core/utils/server_config.dart';
import 'package:crypto_converter/features/crypto_comparison/data/models/coin.model.dart';

abstract class ICoinsRemoteDataSource {
  Future<List<CoinModel>> getCoinList();
}

class CoinsRemoteDataSource extends ICoinsRemoteDataSource {
  final HttpManager http;

  CoinsRemoteDataSource(this.http);

  @override
  Future<List<CoinModel>> getCoinList() async {
    final response = await http.get(ServerConfig.COINS_LIST);

    return (response as List)
        .map((e) => CoinModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
