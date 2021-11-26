import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../model/auction_join.dart';

class SendToServer {
  Future<void> joinAuction(int priceId, String participant, int auctionId, double ratio) async {
    AuctionJoin join = new AuctionJoin(
        priceId: priceId,
        participant: participant,
        auctionId: auctionId,
        ratio: ratio
    );

    print(join.ratio);
    /*
    String addr = "http://05e4-121-65-255-141.ngrok.io/v1/user"; // 서버 주소

    // 경매 참여하기
    final response = await http.post(
      Uri.parse(addr),
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, dynamic> {
            'priceId': join.priceId,
            'participant': join.participant,
            'auctionId': join.auctionId,
            'ratio': join.ratio
          }
      ),
    );
    // httpOk
    if(response.statusCode == 200) return json.decode(response.body);
    throw Exception();
     */
  }
}