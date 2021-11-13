import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  Widget build(BuildContext constext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SiteName'),
        centerTitle: true,
        elevation: 0.0, //앱바 하단 그림자 지우기
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffACB6E5), Color(0xff86FDE8)])
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffACB6E5), Color(0xff86FDE8)])
              ),
              child: Text(
                'SiteName',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('My Page')
            ),
            ListTile(
                leading: Icon(Icons.login_rounded),
                title: Text('Login/SignUp')
            ),
            ListTile(
                leading: Icon(Icons.logout_rounded),
                title: Text('Logout')
            ),
            ListTile(
                leading: Icon(Icons.insert_photo_rounded),
                title: Text('Artwork')
            ),
            ListTile(
                leading: Icon(Icons.file_upload_rounded),
                title: Text('Upload')
            ),
            ListTile(
                leading: Icon(Icons.insert_comment_rounded),
                title: Text('Community')
            ),
            ListTile(
                leading: Icon(Icons.add_shopping_cart),
                title: Text('Auction')
            ),
          ],
        ),
      ),
    );
  }
}