import 'dart:convert';

import 'package:fint/model/auction_initialize.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/auction.dart';
import '../../model/auction_price.dart';
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
    /*
    // httpOk
    if(response.statusCode == 200) return json.decode(response.body);
    throw Exception();
    */
  }
}

class ReceiveFromServer {
  Future<AuctionInitialize> loadSuggestions() async {
    // 임의의 데이터
    /*
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
    */
    String addr = domain + "/v1/pricelist"; // 서버 주소

    /*
    Map<String, int> queryParams = {
      'auctionId': 1,
    };
     */

    // 기존에 존재하는 제안서 받아오기
    final response = await http.get(
      Uri.parse(addr),//.replace(queryParameters: queryParams),
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
    );
    print(response.body);
    if(response.statusCode == 200)
      return AuctionInitialize.fromJson(json.decode(response.body));
    throw Exception();
  }
}