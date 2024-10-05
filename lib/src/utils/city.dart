import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:riada/src/utils/build_context_extension.dart';

enum City {
  dubai,
  abuDhabi,
  sharjah;

  String name(BuildContext context) {
    switch (this) {
      case City.dubai:
        return context.l10N.city_placeholder_dubai;
      case City.abuDhabi:
        return context.l10N.city_placeholder_abu_dhabi;
      case City.sharjah:
        return context.l10N.city_placeholder_sharjah;
    }
  }

  double get lat {
    switch (this) {
      case City.dubai:
        return 25.276987;
      case City.abuDhabi:
        return 24.466667;
      case City.sharjah:
        return 25.348766;
    }
  }

  double get lng {
    switch (this) {
      case City.dubai:
        return 55.296249;
      case City.abuDhabi:
        return 54.366669;
      case City.sharjah:
        return 55.405403;
    }
  }

  GeoPoint get geoPoint {
    return GeoPoint(lat, lng);
  }
}
