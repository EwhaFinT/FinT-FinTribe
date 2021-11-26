import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/appbar.dart';
import '../../widget/drawer.dart';
import '../../page/vote/vote_artwork_info.dart';
import '../../page/vote/vote_result.dart';
import '../../page/vote/vote_info.dart';
import '../../page/vote/vote_form.dart';
import '../../page/vote/vote_event.dart';
import '../../model/vote_proposal.dart';

class VotePage extends StatefulWidget {
  _VotePage createState() => _VotePage();
}

class _VotePage extends State<VotePage> {

  Future<VoteProposal>? proposal;

  @override
  void initState() {
    super.initState();
    proposal = ReceiveFromServer().loadVoteInfo();
  }

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return FutureBuilder<VoteProposal>(
      future: proposal,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          String? content = snapshot.data?.content;
          String? suggester = snapshot.data?.suggester;
          int? price = snapshot.data?.price;
          double? yes = snapshot.data?.yes;
          double? no = snapshot.data?.no;

          return SafeArea(
            child: Scaffold(
              appBar: MyAppBar(AppBar()),
              drawer: MyDrawer(),
              body: Center(
                child: ListView(
                    padding: EdgeInsets.all(width * 0.05),
                    children: <Widget> [
                      Column(
                          children: <Widget> [
                            ArtworkInfo(width: width, height: height),
                            Padding(
                              padding: EdgeInsets.all(width * 0.02),
                            ),
                            Container(
                              padding: EdgeInsets.all(width * 0.04),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: const Color(0xffededed),
                              ),
                              child: Column(
                                children: [
                                  VoteInfo(width: width, height: height, content: content.toString(), suggester: suggester.toString(), price: price as int),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(width * 0.02),
                            ),
                            VoteResult(width: width, height: height, yes: yes as double, no: no as double),
                            Padding(
                              padding: EdgeInsets.all(width * 0.02),
                            ),
                            Container(
                              padding: EdgeInsets.all(width * 0.04),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: const Color(0xffededed),
                              ),
                              child: VoteForm(width: width, height: height, myPrice: 5, totalPrice: price as int, myRatio: 65),
                            ),
                          ]
                      ),
                    ]
                ),
              ),
            ),
          );
        }
        throw Exception();
      },
    );
  }
}