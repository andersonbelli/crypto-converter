import 'package:crypto_converter/features/crypto_compare/domain/entities/supported_currency.entity.dart';

class SupportedCurrencyModel extends SupportedCurrency {
  const SupportedCurrencyModel({
    required String name,
  }) : super(name: name);

  factory SupportedCurrencyModel.fromJson(String json) =>
      SupportedCurrencyModel(
        name: json,
      );

  Map<String, dynamic> toJson() => {'name': name};
}
