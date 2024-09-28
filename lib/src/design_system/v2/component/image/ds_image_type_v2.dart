import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_border_radius_v2.dart';
import 'package:template_flutter_app/src/design_system/v2/graphical_chart/ds_color_v2.dart';
import 'package:flutter/cupertino.dart';

enum DSImageTypeV2 {
  fullScreen,
  xl,
  l,
  m,
  fullLong,
  shortLong,
  s,
  avatar,
  smallAvatar
}

extension DSImageTypeV2Extension on DSImageTypeV2 {
  double get height {
    switch (this) {
      case DSImageTypeV2.fullScreen:
        return double.infinity;
      case DSImageTypeV2.xl:
        return 280;
      case DSImageTypeV2.l:
        return 184;
      case DSImageTypeV2.m:
        return 152;
      case DSImageTypeV2.fullLong:
      case DSImageTypeV2.shortLong:
        return 136;
      case DSImageTypeV2.s:
        return 136;
      case DSImageTypeV2.avatar:
        return 72;
      case DSImageTypeV2.smallAvatar:
        return 40;
    }
  }

  double get width {
    switch (this) {
      case DSImageTypeV2.fullScreen:
        return double.infinity;
      case DSImageTypeV2.xl:
        return double.infinity;
      case DSImageTypeV2.l:
        return 200;
      case DSImageTypeV2.m:
        return 168;
      case DSImageTypeV2.shortLong:
        return 300;
      case DSImageTypeV2.fullLong:
        return double.infinity;
      case DSImageTypeV2.s:
        return 152;
      case DSImageTypeV2.avatar:
        return 72;
      case DSImageTypeV2.smallAvatar:
        return 40;
    }
  }

  double get iconSize {
    switch (this) {
      case DSImageTypeV2.fullScreen:
        return 100;
      case DSImageTypeV2.xl:
        return 80;
      case DSImageTypeV2.l:
        return 40;
      case DSImageTypeV2.m:
        return 40;
      case DSImageTypeV2.fullLong:
      case DSImageTypeV2.shortLong:
        return 40;
      case DSImageTypeV2.s:
        return 40;
      case DSImageTypeV2.avatar:
        return 30;
      case DSImageTypeV2.smallAvatar:
        return 20;
    }
  }

  bool get hasLoaderPlaceholder {
    switch (this) {
      case DSImageTypeV2.fullScreen:
        return true;
      default:
        return false;
    }
  }

  BorderRadius get borderRadius {
    switch (this) {
      case DSImageTypeV2.avatar:
        return BorderRadius.circular(DSBorderRadiusV2.input);
      default:
        return BorderRadius.circular(DSBorderRadiusV2.normal);
    }
  }

  BoxBorder get border {
    switch (this) {
      case DSImageTypeV2.fullScreen:
        return Border.all(width: 1, color: DSColorV2.neutral70);
      case DSImageTypeV2.xl:
        return Border.all(width: 4, color: DSColorV2.neutral70);
      case DSImageTypeV2.l:
        return Border.all(width: 2, color: DSColorV2.neutral70);
      case DSImageTypeV2.m:
        return Border.all(width: 1, color: DSColorV2.neutral70);
      case DSImageTypeV2.fullLong:
      case DSImageTypeV2.shortLong:
        return Border.all(width: 2, color: DSColorV2.neutral70);
      case DSImageTypeV2.s:
        return Border.all(width: 1, color: DSColorV2.neutral70);
      case DSImageTypeV2.avatar:
        return Border.all(width: 2, color: DSColorV2.neutral70);
      case DSImageTypeV2.smallAvatar:
        return Border.all(width: 1, color: DSColorV2.neutral70);
    }
  }
}
