import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lettutor/localization/locales.dart';
import 'package:lettutor/screens/history_screen/history_cards.dart';
import 'package:lettutor/utils/utils.dart';
import 'package:lettutor/widgets/appbar.dart';
import 'package:lettutor/widgets/drawer.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  String page = '1';

  final ScrollController _scrollController = ScrollController();

  void handleScrollToTop() {
    Utils.scrollToTop(_scrollController);
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: appBar(context),
        endDrawer: const DrawerWidget(),
        body: SingleChildScrollView(
          controller: _scrollController,
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
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "History".tr,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                  width: 3))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleData.historyDesc1.getString(context),
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              LocaleData.historyDesc2.getString(context),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  HistoryCardsWidget(
                    handleScrollToTop: handleScrollToTop,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
