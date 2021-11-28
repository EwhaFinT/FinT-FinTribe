import '../model/auction_price.dart';

class AuctionInitialize {
  int upperLimit;
  List<AuctionPrice> priceList;

  AuctionInitialize({required this.upperLimit, required this.priceList});

  factory AuctionInitialize.fromJson(Map<String, dynamic> json) {
    int _upperLimit = json['upperLimit']; // 현재 상한가
    List<dynamic> _priceList = json['priceResponseList']; // 전체 price list (json 형태)

    List<AuctionPrice> totalPriceList = []; // 전체 price list (auction price 형태)
    for(Map<String, dynamic> jsonPrice in _priceList)
      totalPriceList.add(AuctionPrice.fromJson(jsonPrice));

    totalPriceList.sort((b, a) => a.totalPrice.compareTo(b.totalPrice)); // 내림차순 정렬

    List<AuctionPrice> possibleList = []; // 참여 가능한 price list
    for(int i = 0; i < totalPriceList.length; i++) {
      if(totalPriceList[i].totalPrice <= _upperLimit) break; // 현재 상한가 이하인 제안 discard
      possibleList.add(totalPriceList[i]);
    }

    return AuctionInitialize(
      upperLimit: _upperLimit,
      priceList: possibleList,
    );
  }
}