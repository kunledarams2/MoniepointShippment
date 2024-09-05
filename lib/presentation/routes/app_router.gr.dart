// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:moniepoin_shipment/presentation/views/calculator_screen/calculate_success_screen.dart'
    as _i2;
import 'package:moniepoin_shipment/presentation/views/dashboard_screen.dart'
    as _i1;
import 'package:moniepoin_shipment/presentation/views/search_shipment/search_shipment_screen.dart'
    as _i3;
import 'package:moniepoin_shipment/presentation/views/shipment_history/shipment_tracker_screen.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DashBoardScreen.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashBoardScreen(),
      );
    },
    CalculateSuccessScreen.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CalculateSuccessScreen(),
      );
    },
    SearchShipmentScreen.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SearchShipmentScreen(),
      );
    },
    ShipmentTrackerScreen.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ShipmentTrackerScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashBoardScreen]
class DashBoardScreen extends _i5.PageRouteInfo<void> {
  const DashBoardScreen({List<_i5.PageRouteInfo>? children})
      : super(
          DashBoardScreen.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardScreen';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CalculateSuccessScreen]
class CalculateSuccessScreen extends _i5.PageRouteInfo<void> {
  const CalculateSuccessScreen({List<_i5.PageRouteInfo>? children})
      : super(
          CalculateSuccessScreen.name,
          initialChildren: children,
        );

  static const String name = 'CalculateSuccessScreen';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SearchShipmentScreen]
class SearchShipmentScreen extends _i5.PageRouteInfo<void> {
  const SearchShipmentScreen({List<_i5.PageRouteInfo>? children})
      : super(
          SearchShipmentScreen.name,
          initialChildren: children,
        );

  static const String name = 'SearchShipmentScreen';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ShipmentTrackerScreen]
class ShipmentTrackerScreen extends _i5.PageRouteInfo<void> {
  const ShipmentTrackerScreen({List<_i5.PageRouteInfo>? children})
      : super(
          ShipmentTrackerScreen.name,
          initialChildren: children,
        );

  static const String name = 'ShipmentTrackerScreen';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
