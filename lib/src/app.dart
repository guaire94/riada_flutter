import 'package:riada/l10n/app_localizations.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_theme_v2.dart';
import 'package:riada/src/router/routes.dart';
import 'package:riada/src/utils/constants.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatefulWidget {
  final PendingDynamicLinkData? initialDeepLink;

  const MyApp({Key? key, this.initialDeepLink}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    setIntlLocale();
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: TemplateConstants.appName,
        localizationsDelegates: const [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('fr', ''),
        ],
        theme: dsThemeV2(),
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      );
    });
  }

  void setIntlLocale() {
    Locale currentLocale = View.of(context).platformDispatcher.locale;
    Intl.defaultLocale = currentLocale.languageCode;
  }
}
