import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/localization_service.dart';

class ChangeLanguageButton extends StatefulWidget {
  const ChangeLanguageButton({super.key});

  @override
  State<ChangeLanguageButton> createState() => _ChangeLanguageButtonState();
}

class _ChangeLanguageButtonState extends State<ChangeLanguageButton> {
  String lang = "English";
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.3),
            ),
            child: DropdownButton<String>(
                selectedItemBuilder: (context) {
                  return LocalizationService.langs.map<Widget>((String value) {
                    return Row(
                      children: [
                        const SizedBox(
                          width: 12,
                        ),
                        CircleAvatar(
                            radius: 12,
                            child: ClipOval(
                                child: SvgPicture.asset(
                              "assets/images/$lang.svg",
                            ))),
                        const SizedBox(
                          width: 12,
                        ),
                      ],
                    );
                  }).toList();
                },
                items: LocalizationService.langs
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            "assets/images/$value.svg",
                            height: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            value,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: value == lang
                                    ? FontWeight.w700
                                    : FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
                value: lang,
                iconSize: 0.0,
                underline: Container(
                  color: Colors.transparent,
                ),
                isExpanded: false,
                style: const TextStyle(color: Colors.deepPurple),
                onChanged: (newVal) {
                  setState(() {
                    lang = newVal!;
                    LocalizationService().changeLocale(lang);
                  });
                }),
          )
        ]));
  }
}
