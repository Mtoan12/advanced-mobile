import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/localization/locales.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/provider/teacher_provider.dart';
import 'package:lettutor/provider/theme_provider.dart';
import 'package:lettutor/router/app_router.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://455da7c5e58de135ab78c388ba170c9e@o4506637028098049.ingest.sentry.io/4506637029277696';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      // options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );

  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}

typedef LoginCallback = void Function(int _appState);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthProvider authProvider = AuthProvider();
  TeacherProvider teacherProvider = TeacherProvider();
  ThemeProvider themeProvider = ThemeProvider();

  final ThemeData lightTheme = ThemeData.light().copyWith();
  final ThemeData darkTheme = ThemeData.dark().copyWith();

  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    super.initState();
    configureLocalization();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => authProvider),
          ChangeNotifierProvider(create: (context) => teacherProvider),
          ChangeNotifierProvider(create: (context) => themeProvider),
        ],
        child: Consumer<ThemeProvider>(
            builder: (ctx, themeObject, _) => MaterialApp.router(
                  supportedLocales: localization.supportedLocales,
                  localizationsDelegates: localization.localizationsDelegates,
                  theme: ThemeData.light().copyWith(
                    textTheme: GoogleFonts.poppinsTextTheme(),
                  ),
                  darkTheme: ThemeData.dark(),
                  themeMode: themeProvider.mode,
                  // builder: DevicePreview.appBuilder,
                  // translations: LocalizationService(),
                  locale: const Locale('en', 'US'),
                  // fallbackLocale: Locale('vi', 'VN'),
                  debugShowCheckedModeBanner: false,
                  scrollBehavior: MyCustomScrollBehavior(),
                  title: 'Flutter Demo',
                  // theme: ThemeData(
                  //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  //   useMaterial3: true,
                  //   fontFamily: GoogleFonts.poppins().fontFamily,
                  // ),
                  routerConfig: AppRouter(authProvider).router,
                  // routeInformationParser: AppRouter().router.routeInformationParser,
                  // routerDelegate: AppRouter().router.routerDelegate,
                  // routeInformationProvider: AppRouter().router.routeInformationProvider,
                )));
  }

  void configureLocalization() {
    localization.init(mapLocales: LOCALES, initLanguageCode: 'vi');
    localization.onTranslatedLanguage = onTranslatedLanguage;
  }

  void onTranslatedLanguage(Locale? locale) {
    setState(() {
      // localization.setLocale(locale);
    });
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
