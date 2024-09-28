// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:template_flutter_app/src/features/common/presentation/coming_soon/screen/coming_soon_screen.dart'
    as _i2;
import 'package:template_flutter_app/src/features/drawer/presentation/screen/drawer_screen.dart'
    as _i4;
import 'package:template_flutter_app/src/features/home/presentation/screen/home_screen.dart'
    as _i6;
import 'package:template_flutter_app/src/features/list/presentation/details/screen/details_screen.dart'
    as _i3;
import 'package:template_flutter_app/src/features/list/presentation/list/screen/list_screen.dart'
    as _i7;
import 'package:template_flutter_app/src/features/marketplace/presentation/list/screen/marketplace_screen.dart'
    as _i8;
import 'package:template_flutter_app/src/features/user/presentation/additional_profile_information/screen/additional_profile_information_screen.dart'
    as _i1;
import 'package:template_flutter_app/src/features/user/presentation/forget_password/screen/forget_password_screen.dart'
    as _i5;
import 'package:template_flutter_app/src/features/user/presentation/my_profile/screen/my_profile_screen.dart'
    as _i9;
import 'package:template_flutter_app/src/features/user/presentation/sign_up/screen/sign_up_screen.dart'
    as _i10;
import 'package:template_flutter_app/src/features/user/presentation/update_additional_profile_information/screen/update_additional_profile_information_screen.dart'
    as _i11;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AdditionalProfileInformationRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child:
            _i12.WrappedRoute(child: _i1.AdditionalProfileInformationScreen()),
      );
    },
    ComingSoonRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ComingSoonScreen(),
      );
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(
            child: _i3.DetailsScreen(
          key: args.key,
          productId: args.productId,
        )),
      );
    },
    DrawerRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.DrawerScreen(),
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i5.ForgetPasswordScreen()),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: _i6.HomeScreen()),
      );
    },
    ListRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i7.ListScreen()),
      );
    },
    MarketplaceRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i8.MarketplaceScreen()),
      );
    },
    MyProfileRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: _i9.MyProfileScreen()),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: _i10.SignUpScreen()),
      );
    },
    UpdateAdditionalProfileInformationRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(
            child: const _i11.UpdateAdditionalProfileInformationScreen()),
      );
    },
  };
}

/// generated route for
/// [_i1.AdditionalProfileInformationScreen]
class AdditionalProfileInformationRoute extends _i12.PageRouteInfo<void> {
  const AdditionalProfileInformationRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AdditionalProfileInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdditionalProfileInformationRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ComingSoonScreen]
class ComingSoonRoute extends _i12.PageRouteInfo<void> {
  const ComingSoonRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ComingSoonRoute.name,
          initialChildren: children,
        );

  static const String name = 'ComingSoonRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DetailsScreen]
class DetailsRoute extends _i12.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i13.Key? key,
    required String productId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const _i12.PageInfo<DetailsRouteArgs> page =
      _i12.PageInfo<DetailsRouteArgs>(name);
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    required this.productId,
  });

  final _i13.Key? key;

  final String productId;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i4.DrawerScreen]
class DrawerRoute extends _i12.PageRouteInfo<void> {
  const DrawerRoute({List<_i12.PageRouteInfo>? children})
      : super(
          DrawerRoute.name,
          initialChildren: children,
        );

  static const String name = 'DrawerRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i12.PageRouteInfo<void> {
  const ForgetPasswordRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ForgetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ListScreen]
class ListRoute extends _i12.PageRouteInfo<void> {
  const ListRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MarketplaceScreen]
class MarketplaceRoute extends _i12.PageRouteInfo<void> {
  const MarketplaceRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MarketplaceRoute.name,
          initialChildren: children,
        );

  static const String name = 'MarketplaceRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MyProfileScreen]
class MyProfileRoute extends _i12.PageRouteInfo<void> {
  const MyProfileRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MyProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyProfileRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SignUpScreen]
class SignUpRoute extends _i12.PageRouteInfo<void> {
  const SignUpRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.UpdateAdditionalProfileInformationScreen]
class UpdateAdditionalProfileInformationRoute extends _i12.PageRouteInfo<void> {
  const UpdateAdditionalProfileInformationRoute(
      {List<_i12.PageRouteInfo>? children})
      : super(
          UpdateAdditionalProfileInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'UpdateAdditionalProfileInformationRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
