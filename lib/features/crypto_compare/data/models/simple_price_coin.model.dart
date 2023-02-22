import 'package:crypto_converter/features/crypto_compare/data/models/simple_price.model.dart';
import 'package:crypto_converter/features/crypto_compare/domain/entities/simple_price_coin.entity.dart';

class SimplePriceCoinModel extends SimplePriceCoin {
  SimplePriceCoinModel({
    SimplePriceModel? simplePrice,
  }) : super(
          simplePrice: simplePrice,
        );

  factory SimplePriceCoinModel.fromJson({
    required String coinId,
    required String currencyId,
    required Map<String, dynamic> json,
  }) =>
      SimplePriceCoinModel(
        simplePrice: SimplePriceModel.fromJson(
          coinTag: coinId,
          currencyTag: currencyId,
          json: json[coinId] as Map<String, dynamic>,
        ),
      );

  Map<String, dynamic> toJson() => {
        '$simplePrice': simplePrice,
      };
}
