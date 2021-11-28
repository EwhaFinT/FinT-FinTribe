import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      @required this.appBar,
      );

  final AppBar appBar;

  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('FinTribe'),
      centerTitle: true,
      elevation: 0.0, //앱바 하단 그림자 지우기
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffACB6E5), Color(0xff86FDE8)]
          ),
        ),
      ),
    );
  }

  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}