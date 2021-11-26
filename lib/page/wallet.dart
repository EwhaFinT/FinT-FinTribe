import 'package:flutter/material.dart';

import '../widget/appbar.dart';
import '../widget/drawer.dart';
import '../widget/button.dart';

class WalletPage extends StatefulWidget {
  _WalletPage createState() => _WalletPage();
}

class _WalletPage extends State<WalletPage> {

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Expanded(
      child: Scaffold(
        appBar: MyAppBar(AppBar()),
        drawer: MyDrawer(),
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign in to your wallet',
                  style: TextStyle(
                      fontSize: height * 0.03,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    color: Colors.grey
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.all(width * 0.03),
                ),
                Image.asset('assets/images/metamask.png'),
                Padding(
                  padding: EdgeInsets.all(width * 0.03),
                ),
                GradientButton(buttonName: 'Sign in'),
              ],
            ),
          ),
        ),
      ),
    );
    }
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
