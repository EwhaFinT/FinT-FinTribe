class Artwork {
  int artId;
  String artist;
  String title;
  String detail;
  String nftAddress;
  int price;
  int time;

  Artwork({required this.artId, required this.artist, required this.title, required this.detail, required this.nftAddress, required this.price, required this.time});

  factory Artwork.fromJson(Map<String, dynamic> json) {
    return Artwork(
      artId: json['art_id'],
      artist: json['painter'],
      title: json['art_name'],
      detail: json['detail'],
      nftAddress: json['nft_address'],
      price: json['price'],
      time: json['endTime']
    );
  }
}