import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moniepoin_shipment/presentation/custom_designs/custom_margins.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';

import '../../../styles/__export__.dart';

class VehiclesCard extends StatelessWidget {
  const VehiclesCard({super.key,
  required this.transportWidget,
  required this.freightLabel,
  required this.freightDescription});
  final Widget transportWidget;
  final String freightLabel,freightDescription;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152.w,
      margin: EdgeInsets.only(left: 16.w),
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
                color: CustomColors.blackColor.withOpacity(0.1),
                blurRadius: 2,
                offset: const Offset(0,2)
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            freightLabel,
            style: CustomStyle.textStyleInter.copyWith(
                color: CustomColors.blackColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
            ),
          ).paddingOnly(top: 16.h,left: 16.w,right: 18.w,
          bottom: 8.h),
          Text(
            freightDescription,
            style: CustomStyle.textStyleInter.copyWith(
                color: CustomColors.gray500,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                height: 16.84.toLineHeight(14.sp)
            ),
          ).paddingOnly(left: 16.w),
          Align(
            alignment: Alignment.centerRight,
            child: transportWidget,
          ).animate(effects: [
            const SlideEffect(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                begin: Offset(0.30, -0.3),
                delay: Duration(milliseconds: 500),
                end: Offset(0, 0)
            ),
            FadeEffect(
              duration: Duration(milliseconds: 1000),
              delay: Duration(milliseconds: 500),
              curve: Curves.easeIn,
            )
          ])
        ],
      ),
    );
  }
}
