import 'package:flutter/material.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      child: Row(
        children: [
          Icon(
            Icons.trending_up,
            size: 25,
            color: Colors.black45,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Trending Nearby',
            style: TextStyle(fontSize: 18, color: Colors.black38),
          )
        ],
      ),
    );
  }
}
