class ServerConfig {
  static const String BASE_URL = 'api.coingecko.com';

  static const String API_VERSION = '/api/v3/';

  /// List all coins with id, name, and symbol
  static const String COINS_LIST = 'coins/list';

  /// List of supported_vs_currencies
  static const String SIMPLE_SUPPORTED_CURRENCIES =
      'simple/supported_vs_currencies';

  /// Price(s) of cryptocurrency
  static const String SIMPLE_PRICE = 'simple/price';
}
