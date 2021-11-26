import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:fint/model/art.dart';
import 'package:fint/model/vote_proposal.dart';

const double INITIAL_RATE = 0;

class SendToServer { // 서버와 통신
  Future<void> propose(String suggester, String content, String suggestTime, String voteTime, String auctionDate, int price) async {
    VoteProposal proposal = new VoteProposal(
      suggester: suggester,
      content: content,
      suggestTime: suggestTime,
      voteTime: voteTime,
      auctionDate: auctionDate,
      price: price,
      yes: INITIAL_RATE,
      no: INITIAL_RATE,
    );

    // 확인용
    print('suggest' + proposal.suggestTime.toString() + '\nvote' + proposal.voteTime.toString() + '\nauction' + proposal.auctionDate.toString());
    /*
    String addr = "http://05e4-121-65-255-141.ngrok.io/v1/user"; // 서버 주소
    final response = await http.post(
      Uri.parse(addr),
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, dynamic> {
            'suggester': proposal.suggester,
            'content': proposal.content,
            'suggestTime': proposal.suggestTime,
            'voteTime': proposal.voteTime,
            'auctinoDate': proposal.auctionDate,
            'price': proposal.price,
            'yes': proposal.yes,
            'no': proposal.no,
          }
      ),
    );
    */
  }
}

class ReceiveFromServer { // 서버와 통신
  Future<Art> loadArtInfo() async {
    // 임의의 데이터
    Art artwork = new Art(
      title: 'example_title',
      artist: 'example_artist',
      price: 10,
      detail: 'example_detail',
      auctionDate: DateTime.now(),
    );

    return artwork;
    /*
    String addr = "http://05e4-121-65-255-141.ngrok.io/v1/user"; // 서버 주소

    final response = await http.get(Uri.parse(addr));
    if(response.statusCode == 200)
      return Art.fromJson(json.decode(response.body));
    throw Exception();
    */
  }
}