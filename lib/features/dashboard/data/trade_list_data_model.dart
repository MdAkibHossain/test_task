import 'dart:convert';

TradeListDataModel tradeListDataModelFromJson(String str) =>
    TradeListDataModel.fromJson(json.decode(str));

String tradeListDataModelToJson(TradeListDataModel data) =>
    json.encode(data.toJson());

class TradeListDataModel {
  double? currentPrice;
  dynamic comment;
  int? digits;
  int? login;
  double? openPrice;
  DateTime? openTime;
  double? profit;
  Object? sl;
  Object? swaps;
  String? symbol;
  Object? tp;
  Object? ticket;
  Object? type;
  double? volume;

  TradeListDataModel({
    this.currentPrice,
    this.comment,
    this.digits,
    this.login,
    this.openPrice,
    this.openTime,
    this.profit,
    this.sl,
    this.swaps,
    this.symbol,
    this.tp,
    this.ticket,
    this.type,
    this.volume,
  });

  factory TradeListDataModel.fromJson(Map<String, dynamic> json) =>
      TradeListDataModel(
        currentPrice: json["currentPrice"]?.toDouble(),
        comment: json["comment"],
        digits: json["digits"],
        login: json["login"],
        openPrice: json["openPrice"]?.toDouble(),
        openTime:
            json["openTime"] == null ? null : DateTime.parse(json["openTime"]),
        profit: json["profit"]?.toDouble(),
        sl: json["sl"],
        swaps: json["swaps"],
        symbol: json["symbol"],
        tp: json["tp"],
        ticket: json["ticket"],
        type: json["type"],
        volume: json["volume"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "currentPrice": currentPrice,
        "comment": comment,
        "digits": digits,
        "login": login,
        "openPrice": openPrice,
        "openTime": openTime?.toIso8601String(),
        "profit": profit,
        "sl": sl,
        "swaps": swaps,
        "symbol": symbol,
        "tp": tp,
        "ticket": ticket,
        "type": type,
        "volume": volume,
      };
}
