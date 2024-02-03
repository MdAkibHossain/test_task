import 'dart:convert';

MyProfileDataModel myProfileDataModelFromJson(String str) =>
    MyProfileDataModel.fromJson(json.decode(str));

String myProfileDataModelToJson(MyProfileDataModel data) =>
    json.encode(data.toJson());

class MyProfileDataModel {
  String? address;
  double? balance;
  String? city;
  String? country;
  int? currency;
  int? currentTradesCount;
  double? currentTradesVolume;
  double? equity;
  double? freeMargin;
  bool? isAnyOpenTrades;
  bool? isSwapFree;
  int? leverage;
  String? name;
  int? totalTradesCount;
  double? totalTradesVolume;
  int? type;
  int? verificationLevel;
  String? zipCode;

  MyProfileDataModel({
    this.address,
    this.balance,
    this.city,
    this.country,
    this.currency,
    this.currentTradesCount,
    this.currentTradesVolume,
    this.equity,
    this.freeMargin,
    this.isAnyOpenTrades,
    this.isSwapFree,
    this.leverage,
    this.name,
    this.totalTradesCount,
    this.totalTradesVolume,
    this.type,
    this.verificationLevel,
    this.zipCode,
  });

  factory MyProfileDataModel.fromJson(Map<String, dynamic> json) =>
      MyProfileDataModel(
        address: json["address"],
        balance: json["balance"]?.toDouble(),
        city: json["city"],
        country: json["country"],
        currency: json["currency"],
        currentTradesCount: json["currentTradesCount"],
        currentTradesVolume: json["currentTradesVolume"]?.toDouble(),
        equity: json["equity"]?.toDouble(),
        freeMargin: json["freeMargin"]?.toDouble(),
        isAnyOpenTrades: json["isAnyOpenTrades"],
        isSwapFree: json["isSwapFree"],
        leverage: json["leverage"],
        name: json["name"],
        totalTradesCount: json["totalTradesCount"],
        totalTradesVolume: json["totalTradesVolume"]?.toDouble(),
        type: json["type"],
        verificationLevel: json["verificationLevel"],
        zipCode: json["zipCode"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "balance": balance,
        "city": city,
        "country": country,
        "currency": currency,
        "currentTradesCount": currentTradesCount,
        "currentTradesVolume": currentTradesVolume,
        "equity": equity,
        "freeMargin": freeMargin,
        "isAnyOpenTrades": isAnyOpenTrades,
        "isSwapFree": isSwapFree,
        "leverage": leverage,
        "name": name,
        "totalTradesCount": totalTradesCount,
        "totalTradesVolume": totalTradesVolume,
        "type": type,
        "verificationLevel": verificationLevel,
        "zipCode": zipCode,
      };
}
