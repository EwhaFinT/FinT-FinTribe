import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../model/auction_join.dart';
import 'package:fint/domain.dart';

class SendToServer {
  Future<void> joinAuction(int priceId, int participant, int auctionId, double ratio) async {
    AuctionJoin join = new AuctionJoin(
        priceId: priceId,
        participant: participant,
        auctionId: auctionId,
        ratio: ratio
    );

    String addr = domain + "/v1/ratio"; // 서버 주소

    // 경매 참여하기
    final response = await http.post(
      Uri.parse(addr),
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, dynamic> {
            'userId': join.participant,
            'auctionId': join.auctionId,
            'priceId': join.priceId,
            'ratio': join.ratio
          }
      ),
    );
  }
}