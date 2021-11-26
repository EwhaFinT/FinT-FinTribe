import 'dart:convert';

import 'package:fint/model/auction_initialize.dart';
import 'package:http/http.dart' as http;

import '../../model/auction.dart';
import '../../model/auction_price.dart';

class SendToServer {
  Future<void> suggestNewAuction(int totalPrice, double ratio) async {
    Auction auction = new Auction(
      auctionId: 1,
      suggester: '사용자 아이디',
      totalPrice: totalPrice,
      ratio: ratio,
    );

    print(auction.totalPrice.toString() + ' ' + auction.ratio.toString());

    /*
    String addr = "http://05e4-121-65-255-141.ngrok.io/v1/user"; // 서버 주소

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
    // httpOk
    if(response.statusCode == 200) return json.decode(response.body);
    throw Exception();
    */
  }
}

class ReceiveFromServer {
  Future<AuctionInitialize> loadSuggestions() async {
    // 임의의 데이터
    return AuctionInitialize(
        upperLimit: 200,
        priceList: [
          new AuctionPrice(
            auctionId: 1,
            totalPrice: 240,
            remainRatio: 0.2,
          ),
          new AuctionPrice(
            auctionId: 2,
            totalPrice: 220,
            remainRatio: 0.3,
          ),
        ]
    );
    /*
    String addr = "http://05e4-121-65-255-141.ngrok.io/v1/user"; // 서버 주소

    // 기존에 존재하는 제안서 받아오기
    final response = await http.get(Uri.parse(addr));
    if(response.statusCode == 200)
      return //Art.fromJson(json.decode(response.body));
    throw Exception();
    */
  }
}