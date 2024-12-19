// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:riada/src/features/common/presentation/coming_soon/screen/coming_soon_screen.dart'
    as _i3;
import 'package:riada/src/features/drawer/presentation/screen/drawer_screen.dart'
    as _i4;
import 'package:riada/src/features/event/presentation/add/screen/add_event_screen.dart'
    as _i1;
import 'package:riada/src/features/event/presentation/details/screen/event_details_screen.dart'
    as _i5;
import 'package:riada/src/features/event/presentation/list/screen/event_list_screen.dart'
    as _i6;
import 'package:riada/src/features/home/presentation/screen/home_screen.dart'
    as _i7;
import 'package:riada/src/features/marketplace/presentation/list/screen/marketplace_screen.dart'
    as _i8;
import 'package:riada/src/features/user/presentation/additional_profile_information/screen/additional_profile_information_screen.dart'
    as _i2;
import 'package:riada/src/features/user/presentation/my_profile/screen/my_profile_screen.dart'
    as _i9;
import 'package:riada/src/features/user/presentation/sign_up/screen/sign_up_screen.dart'
    as _i10;
import 'package:riada/src/features/user/presentation/update_additional_profile_information/screen/update_additional_profile_information_screen.dart'
    as _i11;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AddEventRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i1.AddEventScreen()),
      );
    },
    AdditionalProfileInformationRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child:
            _i12.WrappedRoute(child: _i2.AdditionalProfileInformationScreen()),
      );
    },
    ComingSoonRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ComingSoonScreen(),
      );
    },
    DrawerRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.DrawerScreen(),
      );
    },
    EventDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<EventDetailsRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(
            child: _i5.EventDetailsScreen(
          key: args.key,
          eventId: args.eventId,
        )),
      );
    },
    EventListRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i6.EventListScreen()),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: _i7.HomeScreen()),
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
/// [_i1.AddEventScreen]
class AddEventRoute extends _i12.PageRouteInfo<void> {
  const AddEventRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AddEventRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddEventRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AdditionalProfileInformationScreen]
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
/// [_i3.ComingSoonScreen]
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
/// [_i5.EventDetailsScreen]
class EventDetailsRoute extends _i12.PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    _i13.Key? key,
    required String eventId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          EventDetailsRoute.name,
          args: EventDetailsRouteArgs(
            key: key,
            eventId: eventId,
          ),
          initialChildren: children,
        );

  static const String name = 'EventDetailsRoute';

  static const _i12.PageInfo<EventDetailsRouteArgs> page =
      _i12.PageInfo<EventDetailsRouteArgs>(name);
}

class EventDetailsRouteArgs {
  const EventDetailsRouteArgs({
    this.key,
    required this.eventId,
  });

  final _i13.Key? key;

  final String eventId;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{key: $key, eventId: $eventId}';
  }
}

/// generated route for
/// [_i6.EventListScreen]
class EventListRoute extends _i12.PageRouteInfo<void> {
  const EventListRoute({List<_i12.PageRouteInfo>? children})
      : super(
          EventListRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventListRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeScreen]
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
