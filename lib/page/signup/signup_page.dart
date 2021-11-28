import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../page/signup/signup_input.dart';
import '../../page/signup/signup_button.dart';
import '../../widget/appbar.dart';
import '../../widget/drawer.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  _SignupPage createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController _id = TextEditingController();
  TextEditingController _pw = TextEditingController();
  TextEditingController _confirmPw = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();

  void dispose() {
    _id.dispose();
    _pw.dispose();
    _confirmPw.dispose();
    _name.dispose();
    _phoneNumber.dispose();
    super.dispose();
  }

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
            height: height * 0.8,
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
                  //height: height * 0.58,
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
                      children: [
                        SignupTextField(width: width, height: height, label: 'ID', pw: _pw, visible: true, controller: _id, funcNo: 1),
                        Padding(
                          padding: EdgeInsets.all(width * 0.02),
                        ),
                        SignupTextField(width: width, height: height, label: 'Password', pw: _pw, visible: false, controller: _pw, funcNo: 2),
                        Padding(
                          padding: EdgeInsets.all(width * 0.02),
                        ),
                        SignupTextField(width: width, height: height, label: 'Confirm\nPassword', pw: _pw, visible: false, controller: _confirmPw, funcNo: 3),
                        Padding(
                          padding: EdgeInsets.all(width * 0.02),
                        ),
                        SignupTextField(width: width, height: height, label: 'Name', pw: _pw, visible: true, controller: _name, funcNo: 4),
                        Padding(
                          padding: EdgeInsets.all(width * 0.02),
                        ),
                        SignupTextField(width: width, height: height, label: 'Phone\nNumber', pw: _pw, visible: true, controller: _phoneNumber, funcNo: 5),
                        Padding(
                          padding: EdgeInsets.all(width * 0.04),
                        ),
                        SignupButton(formKey: formKey, width: width, height: height, id: _id, pw: _pw, name: _name, phoneNumber: _phoneNumber),
                      ],
                    ),
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}