import 'package:flutter/cupertino.dart';

class ArtworkInfo extends StatefulWidget {
  double width;
  double height;

  ArtworkInfo({required this.width, required this.height});
  _ArtworkInfo createState() => _ArtworkInfo();
}

class _ArtworkInfo extends State<ArtworkInfo> {
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Container(
            width: widget.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Text(
                  'Voting',
                  style: TextStyle(
                      fontSize: widget.height * 0.028,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: EdgeInsets.all(widget.width * 0.01),
                ),
                Text(
                  'Blue Lemon',
                  style: TextStyle(
                      fontSize: widget.height * 0.02,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            )
        ),
        Padding(
          padding: EdgeInsets.all(0),
        ),
        Image.asset('assets/images/artwork.jpg', width: widget.width * 0.4)
      ],
    );
  }
}