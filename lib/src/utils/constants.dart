import 'package:cloud_firestore/cloud_firestore.dart';

class ScreenUtilDimen {
  const ScreenUtilDimen._();

  static const double widthOfDesignDraft = 375;
  static const double heightOfDesignDraft = 812;
}

class TemplateConstants {
  static const String appName = "Template";
  static const String appStoreID = "X";

  static const String defaultAvatar =
      "https://firebasestorage.googleapis.com/v0/b/klozy-staging.appspot.com/o/User%2Fdefault%2Fuser.png?alt=media&token=bc31d0f0-061a-46bc-9f9b-442073335535";
  static const String defaultCover =
      "https://firebasestorage.googleapis.com/v0/b/klozy-staging.appspot.com/o/User%2Fdefault%2Fcover.png?alt=media&token=e9322a8e-a8c2-47f6-814b-281aece0ea72";

  static const String city = "Dubai";
  static const String country = "United Arab Emirates";
  static const GeoPoint location = GeoPoint(
    25.213942839042563,
    55.294480453743894,
  );

  static const int imageMinWidth = 428;
  static const int imageMinHeight = 926;
  static const int imageQuality = 50;
  static const String currency = "aed";
  static const String countryCode = "AE";
}

class EntityConstants {
  static const NO_ID = "no_id";
}
