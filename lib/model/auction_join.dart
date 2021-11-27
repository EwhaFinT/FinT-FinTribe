class AuctionJoin {
  int priceId;
  int participant;
  int auctionId;
  double ratio;

  AuctionJoin({
    required this.priceId,
    required this.participant,
    required this.auctionId,
    required this.ratio});

  factory AuctionJoin.fromJson(Map<String, dynamic> json) {
    return AuctionJoin(
      priceId: json['priceId'],
      participant: json['userId'],
      auctionId: json['auctionId'],
      ratio: json['ratio'],
    );
  }
}