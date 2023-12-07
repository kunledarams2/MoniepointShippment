import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../../custom_designs/base_scaffold.dart';
import '../../custom_designs/custom_margins.dart';
import '../../styles/__export__.dart';
import 'widgets/__export__.dart';
class ShipmentHistoryScreen extends HookConsumerWidget {
  const ShipmentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTabBar(),
        YMargin(24.h),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipments',
                style: CustomStyle.textStyleInter.copyWith(
                    color: CustomColors.blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    height: 24.2.toLineHeight(20.sp)
                ),
              ),
              YMargin(16.h),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  physics: const BouncingScrollPhysics(),
                  children:List.generate(8, (index) => const ShipmentHistoryItemCard().animate(effects: [
                    const FadeEffect(
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.easeIn,
                    )
                  ])),
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 16.w),
        )
      ],
    );
  }
}
