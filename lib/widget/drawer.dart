import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../page/mypage.dart';
import '../page/login/login_page.dart';
import '../page/auction/auction_page.dart';
import '../page/artwork.dart';
import '../page/community.dart';
import '../page/upload/upload_page.dart';

import '../model/artwork.dart';
import '../page/main/main_event.dart';

void main() => runApp(const MyDrawer());

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: _MyDrawer(title: appTitle, context_: context),
    );
  }
}

class _MyDrawer extends StatelessWidget {
  _MyDrawer({Key? key, required this.title, required this.context_}) : super(key: key);

  final String title;
  final BuildContext context_;

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xffACB6E5), Color(0xff86FDE8)])
            ),
            child: Text(
              'FinTribe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Page'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              final userId = prefs.getInt('userId') ?? 0;

              if(userId != 0) {
                Navigator.pushAndRemoveUntil(
                  context_,
                  MaterialPageRoute(
                      builder: (context) => MyPage()),
                      (route) => false,
                );
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.login_rounded),
            title: Text('Login/SignUp'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              final userId = prefs.getInt('userId') ?? 0;

              if(userId == 0) {
                Navigator.push(
                  context_,
                  MaterialPageRoute(
                      builder: (context_) => LoginPage()),
                );
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text('Logout'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              final userId = prefs.getInt('userId') ?? 0;

              if(userId != 0) {
                prefs.remove('userId');
                prefs.remove('identity');
                Navigator.push(
                  context_,
                  MaterialPageRoute(
                      builder: (context_) => LoginPage()),
                );
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.insert_photo_rounded),
            title: Text('Artwork'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              final userId = prefs.getInt('userId') ?? 0;

              if(userId != 0) {
                Artwork artwork = await ReceiveFromServer().loadArtworkInfo();
                Navigator.push(
                  context_,
                  MaterialPageRoute(
                      builder: (context_) => ArtworkPage(
                        artworkInfo: artwork,
                      )),
                );
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.file_upload_rounded),
            title: Text('Upload'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              final userId = prefs.getInt('userId') ?? 0;

              if(userId != 0) {
                Navigator.push(
                  context_,
                  MaterialPageRoute(
                      builder: (context_) => UploadPage()),
                );
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.insert_comment_rounded),
            title: Text('Community'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              final userId = prefs.getInt('userId') ?? 0;

              if(userId != 0) {
                Navigator.push(
                  context_,
                  MaterialPageRoute(
                      builder: (context_) => CommunityPage()),
                );
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.add_shopping_cart),
            title: Text('Auction'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              final userId = prefs.getInt('userId') ?? 0;

              if(userId != 0) {
                Navigator.push(
                  context_,
                  MaterialPageRoute(
                      builder: (context_) => AuctionPage()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}