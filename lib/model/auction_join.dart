class AuctionJoin {
  int priceId;
  String participant;
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
      participant: json['participant'],
      auctionId: json['auctionId'],
      ratio: json['ratio'],
    );
  }
}