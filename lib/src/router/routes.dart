import 'package:auto_route/auto_route.dart';
import 'package:riada/src/router/routes.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page, path: '/', children: [
      AutoRoute(
        path: "Marketplace",
        page: MarketplaceRoute.page,
        initial: true,
      ),
    ]),
    CustomRoute(
      path: "/SignUp",
      page: SignUpRoute.page,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      durationInMilliseconds: 50,
    ),
    AutoRoute(
      path: "/AdditionalProfileInformation",
      page: AdditionalProfileInformationRoute.page,
    ),
    AutoRoute(path: "/MyProfile", page: MyProfileRoute.page),
    AutoRoute(path: "/ComingSoon", page: ComingSoonRoute.page),
    AutoRoute(path: "/ForgetPassword", page: ForgetPasswordRoute.page),
    AutoRoute(
      path: "/UpdateAdditionalProfileInformation",
      page: UpdateAdditionalProfileInformationRoute.page,
    ),
    AutoRoute(
      path: "/EventList",
      page: EventListRoute.page,
    ),
    AutoRoute(
      path: "/EventDetails",
      page: EventDetailsRoute.page,
    ),
  ];
}
