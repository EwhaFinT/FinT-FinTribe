import 'package:fint/model/art.dart';
import 'package:flutter/cupertino.dart';

class CreateVoteArtInfo extends StatefulWidget {
  double width;
  double height;
  Future<Art>? artwork;

  CreateVoteArtInfo({required this.width, required this.height, required this.artwork});
  _CreateVoteArtInfo createState() => _CreateVoteArtInfo();
}

class _CreateVoteArtInfo extends State<CreateVoteArtInfo> {
  Widget build(BuildContext context) {
    return FutureBuilder<Art>(
        future: widget.artwork,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            String? title = snapshot.data?.title;
            String? artist = snapshot.data?.artist;
            int? price = snapshot.data?.price;

            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  width: widget.width * 0.35,
                ),
                Padding(
                  padding: EdgeInsets.all(widget.width * 0.015),
                ),
                Container(
                  width: widget.width * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '작품 정보',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\n작품명: $title',
                        style: TextStyle(fontSize: widget.height * 0.018),
                      ),
                      Text(
                        '작가: $artist',
                        style: TextStyle(fontSize: widget.height * 0.018),
                      ),
                      Text(
                        '낙찰 가격: $price',
                        style: TextStyle(fontSize: widget.height * 0.018),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
          throw Exception();
        }
    );
  }
}