import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom( primary: Colors.white),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xffACB6E5), Color(0xff86FDE8)]),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Container(
                    width: 300,
                    height: 100,
                    alignment: Alignment.center,
                    child: Text( 'Button', style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),),
                  ),
                ),
              ),]
        )
    );
  }
}