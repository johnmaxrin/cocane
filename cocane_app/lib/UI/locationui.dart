import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../location_things.dart';

class LocationUi extends StatefulWidget {
  LocationUi({Key? key}) : super(key: key);

  @override
  State<LocationUi> createState() => _LocationUiState();
}

class _LocationUiState extends State<LocationUi> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: getPosName(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.location_pin,
                    size: 20,
                    color: Colors.black38,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    child: Text(
                      snapshot.data.toString(),
                      style: TextStyle(color: Colors.black38),
                    ),
                  )
                ],
              ),
            );
          }
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Text(
                    "Fetching Location...",
                    style: TextStyle(color: Colors.black38),
                  ),
                )
              ],
            ),
          );
        });
  }
}
