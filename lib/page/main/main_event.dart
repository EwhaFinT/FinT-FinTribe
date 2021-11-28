import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/artwork.dart';
import 'package:fint/domain.dart';

class ReceiveFromServer {
  Future<Artwork> loadArtworkInfo() async {
    // 임의의 데이터
    /*
    return new Artwork(
      artId: 1,
      artist: 'Chaeyeon',
      title: 'Blue Lemon',
      detail: '채연이가 프로크리에이트로 그린 그림',
      nftAddress: 'nft_address',
      price: 100,
      time: [24, 56, 33]
    );
    */

    String addr = domain + "/v1/home"; // 서버 주소

    // 기존에 존재하는 제안서 받아오기
    final response = await http.get(Uri.parse(addr));

    if(response.statusCode == 200)
      return Artwork.fromJson(json.decode(response.body));
    throw Exception();
  }
}