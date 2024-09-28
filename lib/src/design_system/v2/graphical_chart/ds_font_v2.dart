import 'dart:ui';

class DSFontSizeV2 {
  static const double displayLarge = 25;
  static const double headlineLarge = 20;
  static const double titleLarge = 15;
  static const double bodyLarge = 13;
}

class DSFontLineHeightV2 {
  static const double displayLarge = 31;
  static const double headlineLarge = 25;
  static const double titleLarge = 19;
  static const double bodyLarge = 16;
}

class DSFontHeightV2 {
  static const double displayLarge =
      DSFontLineHeightV2.displayLarge / DSFontSizeV2.displayLarge;
  static const double headlineLarge =
      DSFontLineHeightV2.headlineLarge / DSFontSizeV2.headlineLarge;
  static const double titleLarge =
      DSFontLineHeightV2.titleLarge / DSFontSizeV2.titleLarge;
  static const double bodyLarge =
      DSFontLineHeightV2.bodyLarge / DSFontSizeV2.bodyLarge;
}

extension DSFontWeightV2 on FontWeight {
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
}
