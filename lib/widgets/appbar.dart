import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/widgets/change_language_button.dart';

PreferredSizeWidget appBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(70),
    child: AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.blue,
      title: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 60),
                blurRadius: 8)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              "assets/images/lettutor_logo.svg",
              width: 200,
            ),
            Row(children: [
              ChangeLanguageButton(),
              SizedBox(
                width: 8,
              ),
              CircleAvatar(
                radius: 24, // Đặt kích thước lớn hơn
                backgroundColor:
                    Colors.grey.withOpacity(0.3), // Màu nền với độ trong suốt
                child: Icon(
                  Icons.menu,
                  color: Colors.grey,
                ),
              )
            ]),
          ],
        ),
      ),
    ),
  );
}