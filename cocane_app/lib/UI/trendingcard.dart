import 'package:flutter/material.dart';

class TrendingCard extends StatefulWidget {
  TrendingCard({Key? key}) : super(key: key);

  @override
  State<TrendingCard> createState() => _TrendingCardState();
}

class _TrendingCardState extends State<TrendingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 2,
          offset: const Offset(0, 1),
          spreadRadius: 0,
        )
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              reportScore(),
              reportText(),
              SizedBox(
                width: 20,
              ),
              reportPoll()
            ],
          )
        ],
      ),
    );
  }
}

Widget reportScore() {
  return Container(
    width: 40,
    height: 100,
    child: Center(
        child: Text(
      '72',
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
    )),
    decoration: new BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
  );
}

Widget reportText() {
  return Container(
    width: 170,
    margin: EdgeInsets.fromLTRB(15, 10, 10, 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '@Totus Tuus',
          style: TextStyle(
              fontSize: 11, color: Colors.black45, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 3,
        ),
        RichText(
          overflow: TextOverflow.clip,
          text: TextSpan(
              text:
                  'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur',
              style: TextStyle(fontSize: 11, color: Colors.black38)),
        )
      ],
    ),
  );
}

Widget reportPoll() {
  return Container(
    margin: EdgeInsets.all(5),
    child: Row(
      children: [
        Icon(
          Icons.thumb_up,
          color: Colors.green,
        ),
        SizedBox(
          width: 15,
        ),
        Icon(
          Icons.thumb_down,
          color: Colors.red,
        )
      ],
    ),
  );
}
