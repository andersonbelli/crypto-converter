import 'package:crypto_converter/features/crypto_list/domain/entities/coin.entity.dart';

class CoinModel extends Coin {
  const CoinModel({
    required String id,
    required String symbol,
    required String name,
  }) : super(id: id, name: name, symbol: symbol);

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
        id: json['id'] as String,
        symbol: json['symbol'] as String,
        name: json['name'] as String,
      );

  Map<String, dynamic> toJson() => {'id': id, 'symbol': symbol, 'name': name};
}
