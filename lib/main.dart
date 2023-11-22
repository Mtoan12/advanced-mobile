import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/localization_service.dart';
import 'package:lettutor/models/user.dart';
import 'package:lettutor/repository/user_account_repository.dart';
import 'package:lettutor/router/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = UserRepository(
        [new User(id: 1, email: "mail@gmail.com", password: "123")]);
    return MultiProvider(
        providers: [
          Provider(create: (context) => userRepository),
        ],
        child: MaterialApp.router(
          builder: DevicePreview.appBuilder,
          // translations: LocalizationService(),
          locale: Locale('en', 'US'),
          // fallbackLocale: Locale('vi', 'VN'),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          routerConfig: AppRouter().router,
          // routeInformationParser: AppRouter().router.routeInformationParser,
          // routerDelegate: AppRouter().router.routerDelegate,
          // routeInformationProvider: AppRouter().router.routeInformationProvider,
        ));
  }
}
