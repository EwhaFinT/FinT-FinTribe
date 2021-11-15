import 'package:flutter/material.dart';

import '../widget/appbar.dart';
import '../widget/drawer.dart';

class LoginPage extends StatefulWidget {
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(AppBar()),
        drawer: MyDrawer(),
        body: Center(
          child: Container(
            height: height * 0.35,
            child: Column(
              children: <Widget> [
                Container(
                  width: width * 0.8,
                  height: height * 0.3,
                  padding: EdgeInsets.all(width * 0.05),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                        colors: [Color(0xffACB6E5), Color(0xff86FDE8)]
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      _buildTextField(width, height, 'ID'),
                      Padding(
                        padding: EdgeInsets.all(width * 0.02),
                      ),
                      _buildTextField(width, height, 'Password'),
                      Padding(
                        padding: EdgeInsets.all(width * 0.04),
                      ),
                      ElevatedButton(
                        onPressed: () { // 로그인 함수 구현 필요

                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: height * 0.024,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffACB6E5)
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white.withOpacity(0.8),
                            padding: EdgeInsets.fromLTRB(width * 0.25, width * 0.02, width * 0.25, width * 0.02)
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.015),
                ),
                Container(
                  width: width * 0.75,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: height * 0.018),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(double width, double height, String label) {
    return Row(
      children: <Widget> [
        Container(
          width: width * 0.2,
          child: Text(
            label,
            style: TextStyle(
              fontSize: height * 0.024,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.04),
        ),
        Expanded(
          child: Container(
            child: TextField(
              style: TextStyle(height: 1.0),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.8),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
      ]
    );
  }
}