import 'package:flutter/material.dart';

import '../../widget/appbar.dart';
import '../../widget/drawer.dart';
import '../../page/login/login_input.dart';
import '../../page/login/login_button.dart';

class LoginPage extends StatefulWidget {
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController _id = TextEditingController();
  TextEditingController _pw = TextEditingController();

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
            height: height * 0.4,
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        LoginTextField(width: width, height: height, label: 'ID', controller: _id),
                        Padding(
                          padding: EdgeInsets.all(width * 0.02),
                        ),
                        LoginTextField(width: width, height: height, label: 'Password', controller: _pw),
                        Padding(
                          padding: EdgeInsets.all(width * 0.03),
                        ),
                        LoginButton(formKey: formKey, width: width, height: height, id: _id, pw: _pw)
                      ],
                    ),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}