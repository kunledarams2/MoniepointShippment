
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/presentation/custom_designs/custom_margins.dart';
import 'package:moniepoin_shipment/presentation/styles/__export__.dart';
import 'package:moniepoin_shipment/presentation/views/homescreen/widgets/home_header.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../../custom_designs/base_scaffold.dart';
import '../../view_model/__export__.dart';
import 'widgets/shipping_detail_widget.dart';
import 'widgets/vehicles_card.dart';


class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final useShipmentViewModel = ref.watch(shipmentVMProvider);
    return CustomScrollView(
      slivers: [
       const HomeHeader(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YMargin(24.h),
                  Text(
                    'Tracking',
                    style: CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.blackColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        height: 24.2.toLineHeight(20.sp)
                    ),
                  ).paddingSymmetric(horizontal: 16.w),
                  YMargin(16.h),
                  const ShippingDetailWidget().paddingSymmetric(horizontal: 16.w),
                ],
              ).
              animate(effects: [
                const SlideEffect(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    begin: Offset(0, 0.3),
                    end: Offset(0, 0)
                ),
                FadeEffect(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeIn,
                )
              ]),
              YMargin(24.h),
              Text(
                'Available vehicles',
                style: CustomStyle.textStyleInter.copyWith(
                    color: CustomColors.blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    height: 24.2.toLineHeight(20.sp)
                ),
              ).paddingOnly(left: 16.w),
              YMargin(16.h),
              SizedBox(
                width: 1.sw,
                height: 0.6.sw,
                child: ListView.builder(itemBuilder: (context,index){
                  return VehiclesCard(transportWidget:Image.asset(useShipmentViewModel.transportVehicles[index]["asset"].toString().png),
                    freightLabel:useShipmentViewModel.transportVehicles[index]["asset"].toString().
                    replaceFirst("ic_", "").replaceAll("_", " ").capitalizeEveryFirstLetter,
                    freightDescription:useShipmentViewModel.transportVehicles[index]["freight"],).animate(effects: [
                    const SlideEffect(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                        begin: Offset(0.30, 0),
                        end: Offset(0, 0)
                    ),
                    FadeEffect(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    )
                  ]);
                },
                  itemCount: useShipmentViewModel.transportVehicles.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(0),),
              ).paddingOnly(bottom: 24.h),
            ]
          ),
        ),
      ],
    );
  }
}

