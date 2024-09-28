import 'package:auto_route/auto_route.dart';

extension RoutingControllerExtensions on StackRouter {
  popUntilNameInclusive({required String routeName}) {
    final index = stack.indexWhere((element) => element.name == routeName);
    var previousRoute = stack[index - 1].name;
    if (previousRoute != null) {
      popUntilRouteWithName(previousRoute);
    } else {
      popUntilRouteWithName(routeName);
    }
  }
}
