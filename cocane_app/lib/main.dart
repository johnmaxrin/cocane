import 'dart:math';

import 'package:cocane_app/UI/addReportWidget.dart';
import 'package:cocane_app/UI/locationui.dart';
import 'package:cocane_app/UI/trendingcard.dart';
import 'package:cocane_app/classes/report.dart';
import 'package:cocane_app/cocane_ipfs.dart';
import 'package:cocane_app/database/localdb.dart';
import 'package:cocane_app/values.dart';
import 'package:flutter/material.dart';

import 'UI/appTopbar.dart';
import 'UI/trending_middleware.dart';

Future<void> main() async {
  runApp(Home());
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              elevation: 2,
              child: Icon(Icons.refresh),
              onPressed: (() {
                // makeReport(Report(Random().nextInt(9999999 - 74524).toString(),
                //     'DummyData', 1.0, 1.0));

                //showAllFiles();

                //deleteFiles(89);
              }),
              backgroundColor: Colors.black,
            ),
            resizeToAvoidBottomInset: false,
            body: Container(
              color: bgcolor,
              child: Column(
                children: [
                  Topbar(),
                  LocationUi(),
                  addReport(),
                  TrendingWidget(),
                  TrendingCard()
                ],
              ),
            )),
      ),
    );
  }
}
