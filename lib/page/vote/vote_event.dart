import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../model/vote.dart';
import '../../model/vote_proposal.dart';
import '../../model/vote_rate.dart';

class SendToServer { // 서버와 통신
  Future<void> submitVote(int voteId, DateTime time, bool choice, double ratio) async {
    Vote vote = new Vote(
      voteId: 1,
      voteTime: time,
      choice: choice,
      voter: '사용자 ID',
      myRatio: ratio
    );

    print('id: ' + vote.voteId.toString() + '\nchoice: ' + vote.choice.toString() + '\nratio: ' + vote.myRatio.toString());

    /*
    String addr = "http://05e4-121-65-255-141.ngrok.io/v1/user"; // 서버 주소
    final response = await http.post(
      Uri.parse(addr),
      headers: <String, String> {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, String> {
            'voteId': vote.voteId,
            'voteTime': vote.time,
            'choice': vote.choice,
            'voter': vote.voter,
            'myRatio': vote.myRatio
          }
      ),
    );
    */
  }
}

class ReceiveFromServer { // 서버와 통신
  // 투표 정보 받아오기
  Future<VoteProposal> loadVoteInfo() async {
    // 임의의 데이터
    VoteProposal proposal = new VoteProposal(
        suggester: 'example_suggester',
        content: 'example_content',
        suggestTime: 'example_suggest_time',
        voteTime: 'example_vote_time',
        auctionDate: 'example_auction_time',
        price: 10,
        yes: 0.2,
        no: 0,
    );

    return proposal;
    /*
    String addr = "http://05e4-121-65-255-141.ngrok.io/v1/user"; // 서버 주소

    final response = await http.get(Uri.parse(addr));
    if(response.statusCode == 200)
      return VoteProposal.fromJson(json.decode(response.body));
    throw Exception();
    */
  }

  // 내 지분 받아오기
}