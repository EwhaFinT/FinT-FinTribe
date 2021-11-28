import '../model/auction_price.dart';

class AuctionInitialize {
  int upperLimit;
  List<AuctionPrice> priceList;

  AuctionInitialize({required this.upperLimit, required this.priceList});

  factory AuctionInitialize.fromJson(Map<String, dynamic> json) {
    List<dynamic> _priceList = json['priceResponseList'];

    List<AuctionPrice> _priceList_ = [];

    for(Map<String, dynamic> jsonPrice in _priceList) {
      _priceList_.add(AuctionPrice.fromJson(jsonPrice));
    }
    _priceList_.sort((b, a) => a.totalPrice.compareTo(b.totalPrice));

    return AuctionInitialize(
      upperLimit: json['upperLimit'],
      priceList: _priceList_,
    );
  }
}