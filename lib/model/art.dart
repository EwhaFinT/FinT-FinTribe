class Art {
  String title;
  String artist;
  int price;
  String detail;
  DateTime auctionDate;

  Art({
    required this.title,
    required this.artist,
    required this.price,
    required this.detail,
    required this.auctionDate
  });

  factory Art.fromJson(Map<String, dynamic> json) {
    return Art(
      title: json['title'],
      artist: json['id'],
      price: json['price'],
      detail: json['detail'],
      auctionDate: json['auctionDate'],
    );
  }
}