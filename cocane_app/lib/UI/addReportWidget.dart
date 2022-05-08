import 'dart:math';

import 'package:cocane_app/classes/report.dart';
import 'package:cocane_app/cocane_ipfs.dart';
import 'package:cocane_app/location_things.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class addReport extends StatefulWidget {
  addReport({Key? key}) : super(key: key);

  @override
  State<addReport> createState() => _addReportState();
}

class _addReportState extends State<addReport> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      height: 180,
      decoration: new BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(
              0.0,
              2.0,
            ),
            blurRadius: 3.0,
            spreadRadius: 0.0,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          textArea(),
          downColumn(context),
        ],
      ),
    );
  }
}

final myController = TextEditingController();
Widget textArea() {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
    height: 100,
    decoration: new BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Container(
      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
      child: TextField(
        controller: myController,
        style: TextStyle(fontSize: 15, color: Colors.black45),
        inputFormatters: [LengthLimitingTextInputFormatter(150)],
        decoration: new InputDecoration(
            hintStyle: TextStyle(color: Colors.black38),
            hintText: 'Report drug trafficking ',
            border: InputBorder.none),
      ),
    ),
  );
}

Widget downColumn(BuildContext context) {
  return Container(
    padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.image,
          size: 35,
          color: Colors.black26,
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () async {
            Position pos = await getPosition();
            print(pos.latitude);
            makeReport(Report(Random().nextInt(9999999 - 74524).toString(),
                myController.text, pos.latitude, pos.longitude));
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                });

            myController.clear();
          },
          child: Container(
            height: 27,
            width: 70,
            decoration: new BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                'Report',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

AlertDialog alert = new AlertDialog(
  title: Text(
    'Success',
    style: TextStyle(fontSize: 17),
  ),
  content: Text(
    'Your File has successfully uploaded into IPFS server',
    style: TextStyle(fontSize: 14),
  ),
  actions: [okButton],
);

Widget okButton = TextButton(onPressed: () {}, child: Text('OK'));
