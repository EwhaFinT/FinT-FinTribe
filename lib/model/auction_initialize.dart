import '../model/auction_price.dart';

class AuctionInitialize {
  int upperLimit;
  List<AuctionPrice> priceList;

  AuctionInitialize({required this.upperLimit, required this.priceList});

  factory AuctionInitialize.fromJson(Map<String, dynamic> json) {
    return AuctionInitialize(
      upperLimit: json['upperLimit'],
      priceList: json['priceList'],
    );
  }
}