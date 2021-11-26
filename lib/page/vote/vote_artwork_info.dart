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
                  'Artwork Name',
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
          padding: EdgeInsets.all(widget.width * 0.015),
        ),
        Image.network(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          width: widget.width * 0.35,
        ),
      ],
    );
  }
}