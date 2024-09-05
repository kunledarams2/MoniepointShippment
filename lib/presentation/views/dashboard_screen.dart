import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../custom_designs/base_scaffold.dart';
import '../styles/__export__.dart';
import '../view_model/__export__.dart';
@RoutePage(name: 'DashBoardScreen')
class DashBoardScreen extends HookConsumerWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:  CustomColors.darkBlue100, // Set your desired color
      statusBarIconBrightness: Brightness.light, // For white icons on a dark background
    ));
    final useShipmentViewModel = ref.watch(shipmentVMProvider);

    return BaseScaffold(
      includeHorizontalPadding: false,
      backgroundColor:CustomColors.gray900,
      childHasCustomHeader: false,

      safeTop: false,
      onWillPop: () {},
      bottomNavBar: const CustomBottomNavigationBar(),
      builder: (size) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor:CustomColors.deepPurple,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,

            // systemNavigationBarContrastEnforced: false,
            // systemStatusBarContrastEnforced: false,
          ),
          child: SizedBox(
            width: 1.sw,
            height: 1.sw,
            child:useShipmentViewModel.selectedDashBoardTab.page,
          ),
        );
      },
    );
  }
}
