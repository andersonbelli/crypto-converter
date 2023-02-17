class CoinModel {
  final String? id;
  final String? symbol;
  final String? name;

  const CoinModel({
    this.id,
    this.symbol,
    this.name,
  });

  CoinModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        symbol = json['symbol'] as String?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'symbol': symbol, 'name': name};
}
