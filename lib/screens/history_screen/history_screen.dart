import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lettutor/screens/history_screen/history_cards.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:number_paginator/number_paginator.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.05,
              right: screenHeight * 0.02,
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/history.svg',
                    width: 100,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "history".tr,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                  width: 3))),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "historyDesc1".tr,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "historyDesc2".tr,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  HistoryCardsWidget(),
                  SizedBox(
                    height: 24,
                  ),
                  NumberPaginator(numberPages: 1),
                ],
              ),
            ),
          ),
        ));
  }
}
