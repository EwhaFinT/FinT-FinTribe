class AuctionPrice {
  int priceId;
  int auctionId;
  int totalPrice;
  double remainRatio;

  AuctionPrice({required this.priceId, required this.auctionId, required this.totalPrice, required this.remainRatio});

  factory AuctionPrice.fromJson(Map<String, dynamic> json) {
    return AuctionPrice(
      priceId: json['priceId'],
      totalPrice: json['price'],
      remainRatio: json['remainderRatio'],
      auctionId: json['auctionId'],
    );
  }
}