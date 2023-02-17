import 'package:crypto_converter/features/crypto_comparison/data/models/coin.model.dart';

abstract class ICoinsRemoteDataSource {
  Future<List<CoinModel>> getCoinList();
}
