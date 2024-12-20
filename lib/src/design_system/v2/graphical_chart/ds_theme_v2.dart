import 'package:flutter/material.dart';
import 'package:riada/gen/fonts.gen.dart';
import 'package:riada/src/design_system/ds_spacing.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:riada/src/design_system/v2/graphical_chart/ds_font_v2.dart';

ThemeData dsThemeV2() {
  return ThemeData(
    useMaterial3: false,
    primaryColor: DSColorV2.primary,
    colorScheme: ColorScheme(
      primary: DSColorV2.primary,
      onPrimary: Colors.white,
      secondary: DSColorV2.primary,
      onSecondary: Colors.white,
      error: DSColorV2.danger,
      onError: Colors.white,
      background: DSColorV2.primary,
      onBackground: Colors.white,
      surface: DSColorV2.primary,
      onSurface: DSColorV2.primary,
      brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: FontFamily.rufina,
        height: DSFontHeightV2.displayLarge,
        fontSize: DSFontSizeV2.displayLarge,
        fontWeight: DSFontWeightV2.regular,
        color: DSColorV2.secondary,
      ),
      headlineLarge: TextStyle(
        fontFamily: FontFamily.rufina,
        height: DSFontHeightV2.headlineLarge,
        fontSize: DSFontSizeV2.headlineLarge,
        fontWeight: DSFontWeightV2.regular,
        color: DSColorV2.secondary,
      ),
      titleLarge: TextStyle(
        fontFamily: FontFamily.rufina,
        height: DSFontHeightV2.titleLarge,
        fontSize: DSFontSizeV2.titleLarge,
        fontWeight: DSFontWeightV2.regular,
        color: DSColorV2.secondary,
      ),
      bodyLarge: TextStyle(
        fontFamily: FontFamily.inter,
        height: DSFontHeightV2.bodyLarge,
        fontSize: DSFontSizeV2.bodyLarge,
        fontWeight: DSFontWeightV2.medium,
        color: DSColorV2.secondary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.only(
          left: DSSpacing.sizeS,
          right: DSSpacing.sizeS,
          top: DSSpacing.sizeXxs,
          bottom: DSSpacing.sizeXxs,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.only(
          left: DSSpacing.sizeS,
          right: DSSpacing.sizeS,
          top: DSSpacing.sizeXxs,
          bottom: DSSpacing.sizeXxs,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: DSColorV2.secondary,
      ),
      titleTextStyle: TextStyle(
        fontFamily: FontFamily.rufina,
        height: DSFontHeightV2.displayLarge,
        fontSize: DSFontSizeV2.displayLarge,
        fontWeight: DSFontWeightV2.regular,
        color: DSColorV2.secondary,
      ),
    ),
  );
}
