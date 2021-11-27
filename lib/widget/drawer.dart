import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../page/mypage.dart';
import '../page/login/login_page.dart';
import '../page/auction/auction_page.dart';
import '../page/artwork.dart';
import '../page/community.dart';
import '../page/upload.dart';

import '../model/artwork.dart';
import '../page/main/main_event.dart';

void main() => runApp(const MyDrawer());

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: _MyDrawer(title: appTitle),
    );
  }
}

class _MyDrawer extends StatelessWidget {
  const _MyDrawer({Key? key, required this.title}) : super(key: key);

  final String title;

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyPage()),
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
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()),
                );
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.insert_photo_rounded),
            title: Text('Artwork'),
            onTap: () async {
              Artwork artwork = await ReceiveFromServer().loadArtworkInfo();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArtworkPage(
                      artworkInfo: artwork,
                    )),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.file_upload_rounded),
            title: Text('Upload'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UploadPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.insert_comment_rounded),
            title: Text('Community'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CommunityPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_shopping_cart),
            title: Text('Auction'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AuctionPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}