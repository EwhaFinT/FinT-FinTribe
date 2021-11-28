class VoteProposal {
  String suggester;
  String content;
  String suggestTime;
  String voteTime;
  String auctionDate;
  int price;
  double yes;
  double no;

  VoteProposal({
    required this.suggester,
    required this.content,
    required this.suggestTime,
    required this.voteTime,
    required this.auctionDate,
    required this.price,
    required this.yes,
    required this.no,
  });

  factory VoteProposal.fromJson(Map<String, dynamic> json) {
    return VoteProposal(
      suggester: json['suggester'],
      content: json['content'],
      suggestTime: json['suggestTime'],
      voteTime: json['voteTime'],
      auctionDate: json['auctionDate'],
      price: json['price'],
      yes: json['yes'],
      no: json['no'],
    );
  }
}