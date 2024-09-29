import 'package:riada/gen/fonts.gen.dart';
import 'package:riada/l10n/app_localizations.dart';
import 'package:riada/src/design_system/v2/ds_app_list_view_item.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_theme_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DSAppV2 extends StatefulWidget {
  const DSAppV2({Key? key}) : super(key: key);

  @override
  _DSAppState createState() => _DSAppState();
}

class _DSAppState extends State<DSAppV2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Design System V2",
      theme: dsThemeV2(),
      home: MyDesignSystemScreen(),
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
    );
  }
}

class MyDesignSystemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Design System",
          style: TextStyle(
            fontFamily: FontFamily.rufina,
            fontSize: 36,
            color: DSColorV2.primary,
          ),
        ),
      ),
      backgroundColor: DSColorV2.neutral35,
      body: SafeArea(
        child: ListView(
          children: [
            DSAppListViewItem(DSAppListItem.textVariation),
            DSAppListViewItem(DSAppListItem.color),
            DSAppListViewItem(DSAppListItem.button),
            DSAppListViewItem(DSAppListItem.image),
            DSAppListViewItem(DSAppListItem.input),
            DSAppListViewItem(DSAppListItem.listLongGrid),
            DSAppListViewItem(DSAppListItem.listSmallGrid),
            DSAppListViewItem(DSAppListItem.listCarousel),
            DSAppListViewItem(DSAppListItem.bottomSheet),
          ],
        ),
      ),
    );
  }
}
