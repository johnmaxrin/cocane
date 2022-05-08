import 'package:cocane_app/values.dart';
import 'package:flutter/material.dart';

class Topbar extends StatelessWidget {
  const Topbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(27, 20, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              'cocane',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  color: Colors.black38),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 35,
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.more_vert,
                size: 35,
                color: Colors.black38,
              )
            ],
          )
        ],
      ),
    );
  }
}
