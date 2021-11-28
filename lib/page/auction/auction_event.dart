import 'dart:convert';

import 'package:fint/model/auction_initialize.dart';
import 'package:http/http.dart' as http;

import '../../model/auction.dart';
import 'package:fint/domain.dart';

class SendToServer {
  Future<void> suggestNewAuction(int suggester, int totalPrice, double ratio) async {
    Auction auction = new Auction(
      auctionId: 1,
      suggester: suggester,
      totalPrice: totalPrice,
      ratio: ratio,
    );

    String addr = domain + "/v1/price"; // 서버 주소

    // 경매 가격 제안 보내기
    final response = await http.post(
      Uri.parse(addr),
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, dynamic> {
            'userId': auction.suggester,
            'auctionId': auction.auctionId,
            'auctionPrice': auction.totalPrice,
            'ratio': auction.ratio,
          }
      ),
    );
  }
}

class ReceiveFromServer {
  Future<AuctionInitialize> loadSuggestions() async {

    String addr = domain + "/v1/pricelist"; // 서버 주소

    // 기존에 존재하는 제안서 받아오기
    final response = await http.get(
      Uri.parse(addr),
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
    );

    if(response.statusCode == 200)
      return AuctionInitialize.fromJson(json.decode(response.body));
    throw Exception();
  }
}