import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/provider/theme_provider.dart';
import 'package:lettutor/router/app_router_constant.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late FlutterLocalization _flutterLocalization;
  late String _currentLocale;
  void toggleLanguage() {
    if (_currentLocale == 'en') {
      _setLocale('vi');
    } else if (_currentLocale == 'vi') {
      _setLocale('en');
    } else {
      return;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = context.watch<ThemeProvider>();
    bool isDarkMode = themeProvider.mode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.language),
              title: Text(_currentLocale == 'en'
                  ? 'Change Language (English)'
                  : 'Thay đổi Ngôn ngữ (Vietnamese)'),
              onTap: toggleLanguage,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
                leading: const Icon(Icons.dark_mode),
                title: const Text("Dark mode"),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleMode();
                    context.goNamed(AppRouterConstant.teachersListRouteName);
                  },
                )),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                context.pushNamed(AppRouterConstant.profileRouteName);
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                context.read<AuthProvider>().logout();
                context.goNamed(AppRouterConstant.loginRouteName);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _setLocale(String value) {
    if (value == 'en') {
      _flutterLocalization.translate('en');
    } else if (value == 'vi') {
      _flutterLocalization.translate('vi');
    } else {
      return;
    }

    setState(() {
      _currentLocale = value;
    });
  }
}
