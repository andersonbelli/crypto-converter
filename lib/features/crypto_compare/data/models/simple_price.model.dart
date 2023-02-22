import 'package:crypto_converter/features/crypto_compare/domain/entities/simple_price.entity.dart';

class SimplePriceModel extends SimplePrice {
  SimplePriceModel({
    required String coinTag,
    required String currencyTag,
    double? coinValue,
    double? coinMarketCap,
    dynamic coin24hVol,
    double? coin24hChange,
    int? lastUpdatedAt,
  }) : super(
          coinTag: coinTag,
          currencyTag: currencyTag,
          coinValue: coinValue,
          coinMarketCap: coinMarketCap,
          coin24hVol: coin24hVol,
          coin24hChange: coin24hChange,
          lastUpdatedAt: lastUpdatedAt,
        );

  factory SimplePriceModel.fromJson({
    required String coinTag,
    required String currencyTag,
    required Map<String, dynamic> json,
  }) {
    return SimplePriceModel(
      coinTag: coinTag,
      currencyTag: currencyTag,
      coinValue: json[coinTag][currencyTag] as double?,
      coinMarketCap: json[coinTag]['${currencyTag}_market_cap'] != null
          ? double.parse(
              json[coinTag]['${currencyTag}_market_cap'].toString(),
            )
          : 0,
      coin24hVol: json[coinTag]['${currencyTag}_24h_vol'],
      coin24hChange: json[coinTag]['${currencyTag}_24h_change'] as double?,
      lastUpdatedAt: json[coinTag]['last_updated_at'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        currencyTag: coinValue,
        '${currencyTag}_market_cap': coinMarketCap,
        '${currencyTag}_24h_vol': coin24hVol,
        '${currencyTag}_24h_change': coin24hChange,
        'last_updated_at': lastUpdatedAt
      };
}
