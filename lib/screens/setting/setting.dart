import 'package:flutter/material.dart';
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
  bool isEnglish = true;

  void toggleLanguage() {
    setState(() {
      isEnglish = !isEnglish;
    });
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
              title: Text(isEnglish
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
}
