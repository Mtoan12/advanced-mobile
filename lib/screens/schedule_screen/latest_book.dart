import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LatestBookWidget extends StatefulWidget {
  const LatestBookWidget({super.key});

  @override
  State<LatestBookWidget> createState() => _LatestBookWidgetState();
}

class _LatestBookWidgetState extends State<LatestBookWidget> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "latestBook".tr,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          color: Colors.grey.withOpacity(0.1)),
                      width: screenWidth * 0.25,
                      height: 48,
                      child: Center(
                          child: Text(
                        "Name",
                        style: TextStyle(fontSize: 12),
                      ))),
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(color: Colors.grey.withOpacity(0.3)),
                      )),
                      width: screenWidth * 0.25,
                      height: 48,
                      child: Center(
                          child: Text(
                        "sample.pdf",
                        style: TextStyle(color: Colors.blue[500], fontSize: 12),
                      ))),
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                            top:
                                BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          color: Colors.grey.withOpacity(0.1)),
                      width: screenWidth * 0.15,
                      height: 48,
                      child: Center(
                          child: Text("Page", style: TextStyle(fontSize: 12)))),
                  Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          right:
                              BorderSide(color: Colors.grey.withOpacity(0.3)),
                        ),
                      ),
                      width: screenWidth * 0.1,
                      height: 48,
                      child: Center(
                          child: Text("0", style: TextStyle(fontSize: 12)))),
                ],
              ),
              Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: Colors.grey.withOpacity(0.3)),
                            left:
                                BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                          color: Colors.grey.withOpacity(0.1)),
                      width: screenWidth * 0.25,
                      height: 48,
                      child: Center(
                          child: Text(
                        "Description",
                        style: TextStyle(fontSize: 12),
                      ))),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                      width: screenWidth * 0.5,
                      height: 48,
                      child: Center(
                          child: Text(
                        "",
                        style: TextStyle(color: Colors.blue[800], fontSize: 12),
                      ))),
                ],
              ),
              SizedBox(
                height: 24,
              )
            ],
          ),
        ),
      ],
    );
  }
}
