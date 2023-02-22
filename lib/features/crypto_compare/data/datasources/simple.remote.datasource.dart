import 'dart:convert';

import 'package:crypto_converter/core/http/http_manager.dart';
import 'package:crypto_converter/core/utils/server_config.dart';
import 'package:crypto_converter/features/crypto_compare/data/models/simple_price.model.dart';
import 'package:crypto_converter/features/crypto_compare/data/models/supported_currency.model.dart';

abstract class ISimpleRemoteDataSource {
  Future<List<SupportedCurrencyModel>> getSupportedCurrencies();

  Future<SimplePriceModel> getSimplePrice({
    required String coinId,
    required String currencyName,
  });
}

class SimpleRemoteDataSource extends ISimpleRemoteDataSource {
  final HttpManager http;

  SimpleRemoteDataSource({required this.http});

  @override
  Future<List<SupportedCurrencyModel>> getSupportedCurrencies() async {
    final response =
        await http.get(endpoint: ServerConfig.SIMPLE_SUPPORTED_CURRENCIES);

    return (json.decode(response.toString()) as List)
        .map((e) => SupportedCurrencyModel.fromJson(e as String))
        .toList();
  }

  @override
  Future<SimplePriceModel> getSimplePrice({
    required String coinId,
    required String currencyName,
  }) async {
    final response = await http.get(
      endpoint: ServerConfig.SIMPLE_PRICE,
      query: {
        'ids': coinId,
        'vs_currencies': currencyName,
        'include_market_cap': 'true',
        'include_24hr_vol': 'true',
        'include_24hr_change': 'true',
        'include_last_updated_at': 'true',
        'precision': 'full'
      },
    );

    return SimplePriceModel.fromJson(
      coinTag: coinId,
      currencyTag: currencyName,
      json: jsonDecode(response.toString()) as Map<String, dynamic>,
    );
  }
}
