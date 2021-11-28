import 'package:fint/page/join_auction/join_auction_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/auction_price.dart';

class Suggestions extends StatefulWidget {
  double width;
  double height;
  List<AuctionPrice> priceList;

  Suggestions({required this.width, required this.height, required this.priceList});
  _Suggestions createState() => _Suggestions();
}

class _Suggestions extends State<Suggestions> {

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.width * 0.04),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: const Color(0xffededed),
      ),
      child: Column(
        children: [
          Text(
            '참여 가능한 제안',
            style: TextStyle(
              fontSize: widget.height * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(widget.width * 0.02),
          ),
          SizedBox(
            height: widget.height * 0.25,
            child: ListView.builder(
              itemCount: widget.priceList.length,
              itemBuilder: (context, index) {
                AuctionPrice auc = widget.priceList[index];

                return new Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => JoinAuctionPage(
                                price: new AuctionPrice(
                                  auctionId: 1,
                                  priceId: auc.priceId,
                                  totalPrice: auc.totalPrice,
                                  remainRatio: auc.remainRatio,
                                )
                            )
                          )
                        );
                      },
                      child: Container(
                        width: widget.width * 0.8,
                        padding: EdgeInsets.all(widget.width * 0.03),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: const Color(0xffc4c4c4),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${((1-auc.remainRatio) * auc.totalPrice).round()} KLAY / ${auc.totalPrice} KLAY',
                          style: TextStyle(
                            fontSize: widget.height * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(widget.width * 0.02),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}