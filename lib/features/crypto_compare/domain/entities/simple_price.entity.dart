class SimplePrice {
  final String coinTag;
  final String currencyTag;
  final double? coinValue;
  final double? coinMarketCap;
  final dynamic coin24hVol;
  final double? coin24hChange;
  final int? lastUpdatedAt;

  SimplePrice({
    required this.coinTag,
    required this.currencyTag,
    this.coinValue,
    this.coinMarketCap,
    this.coin24hVol,
    this.coin24hChange,
    this.lastUpdatedAt,
  });
}
