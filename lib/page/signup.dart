import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/appbar.dart';
import '../widget/drawer.dart';

class SignupPage extends StatefulWidget {
  _SignupPage createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {

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
            height: height * 0.7,
            child: Column(
              children: <Widget> [
                Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: height * 0.028,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.04),
                ),
                Container(
                  width: width * 0.8,
                  height: height * 0.58,
                  padding: EdgeInsets.all(width * 0.05),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                        colors: [Color(0xffACB6E5), Color(0xff86FDE8)]
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildTextField(width, height, 'ID'),
                      Padding(
                        padding: EdgeInsets.all(width * 0.02),
                      ),
                      _buildTextField(width, height, 'Password'),
                      Padding(
                        padding: EdgeInsets.all(width * 0.02),
                      ),
                      _buildTextField(width, height, 'Confirm\nPassword'),
                      Padding(
                        padding: EdgeInsets.all(width * 0.02),
                      ),
                      _buildTextField(width, height, 'Name'),
                      Padding(
                        padding: EdgeInsets.all(width * 0.02),
                      ),
                      _buildTextField(width, height, 'Phone\nNumber'),
                      Padding(
                        padding: EdgeInsets.all(width * 0.04),
                      ),
                      ElevatedButton(
                        onPressed: () { // 회원가입 함수 구현 필요

                        },
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                              fontSize: height * 0.024,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffACB6E5)
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white.withOpacity(0.8),
                            padding: EdgeInsets.fromLTRB(width * 0.1, width * 0.04, width * 0.1, width * 0.04)
                        ),
                      ),
                    ],
                  ),
                ),
              ]
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
      ],
    );
  }
}