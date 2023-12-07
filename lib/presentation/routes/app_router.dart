
import 'package:auto_route/auto_route.dart';

import '__export__.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: DashBoardScreen.page,
      path: Routes.dashBoardScreenRoute,
    ),
    AutoRoute(
      page: SearchShipmentScreen.page,
      path: Routes.searchShipmentScreenRoute,
    ),
    AutoRoute(
      page: CalculateSuccessScreen.page,
      path: Routes.calculateSuccessScreenRoute,
    ),
  ];
}
