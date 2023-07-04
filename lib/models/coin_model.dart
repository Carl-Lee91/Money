class CoinModel {
  final String minPrice, maxPrice, tradeAmount24, fluctate24, fluctateRate24;

  CoinModel.fromJson(Map<String, dynamic> json)
      : minPrice = json["data"]["min_price"],
        maxPrice = json["data"]["max_price"],
        tradeAmount24 = json["data"]["units_traded_24H"],
        fluctate24 = json["data"]["fluctate_24H"],
        fluctateRate24 = json["data"]["fluctate_rate_24H"];
}
