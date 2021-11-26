// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.



import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'page/login/login_page.dart';
import 'page/signup/signup_page.dart';
import 'page/create_vote/create_vote_page.dart';
import 'page/vote/vote_page.dart';
import 'page/auction/auction_page.dart';
import './page/wallet.dart';
import 'page/join_auction/join_auction_page.dart';

import './page/upload.dart';
import './page/mypage.dart';
import './page/success.dart';
import './page/artwork.dart';
import './page/community.dart';
import './page/community_write.dart';
import 'package:fint/page/mainpage.dart';

import './model/auction_price.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuctionPage(), //UploadPage(),//JoinAuctionPage(),//VotePage(),//CreateVotePage(),//SignupPage(),//LoginPage()

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KO'),
      ],
    );
  }
}