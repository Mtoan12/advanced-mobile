import 'dart:ui';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/provider/course_provider.dart';
import 'package:lettutor/provider/schedule_provider.dart';
import 'package:lettutor/provider/specialities_provider.dart';
import 'package:lettutor/provider/teachers_list_provider.dart';
import 'package:lettutor/provider/user_provider.dart';
import 'package:lettutor/router/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
  // runApp(const MyApp());
}

typedef LoginCallback = void Function(int _appState);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthProvider authProvider = AuthProvider();
  UserProvider userProvider = UserProvider();
  TeachersListProvider teachersListProvider = TeachersListProvider();
  ScheduleProvider scheduleProvider = ScheduleProvider();
  CourseProvider courseProvider = CourseProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => authProvider),
          ChangeNotifierProvider(create: (context) => userProvider),
          ChangeNotifierProvider(create: (context) => teachersListProvider),
          ChangeNotifierProvider(
            create: (context) => scheduleProvider,
          ),
          ChangeNotifierProvider(
            create: (context) => courseProvider,
          ),
        ],
        child: MaterialApp.router(
          builder: DevicePreview.appBuilder,
          // translations: LocalizationService(),
          locale: const Locale('en', 'US'),
          // fallbackLocale: Locale('vi', 'VN'),
          debugShowCheckedModeBanner: false,
          scrollBehavior: MyCustomScrollBehavior(),
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          routerConfig: AppRouter(authProvider).router,
          // routeInformationParser: AppRouter().router.routeInformationParser,
          // routerDelegate: AppRouter().router.routerDelegate,
          // routeInformationProvider: AppRouter().router.routeInformationProvider,
        ));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
