import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../model/art.dart';

class SendToServer { // 서버와 통신
  Future<void> sendToServer(String title, String artist, int price, String detail, DateTime auctionDate) async {
    Art art = new Art(
        title: title,
        artist: artist,
        price: price,
        detail: detail,
        auctionDate: auctionDate
    );

    String addr = "http://05e4-121-65-255-141.ngrok.io/v1/user"; // 서버 주소
    final response = await http.post(
      Uri.parse(addr),
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, dynamic> {
            'title': art.title,
            'artist': art.artist,
            'price': art.price,
            'detail': art.auctionDate,
          }
      ),
    );
  }
}