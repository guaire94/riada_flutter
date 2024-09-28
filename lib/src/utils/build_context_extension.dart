import 'package:template_flutter_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get l10N => AppLocalizations.of(this)!;

  String translateRemoteClotheCategoryKey(String key) {
    switch (key) {
      default:
        return key;
    }
  }
}

extension ColorSchemeBuildContext on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension TextThemeBuildContext on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
