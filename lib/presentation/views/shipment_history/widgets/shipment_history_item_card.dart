import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/presentation/custom_designs/custom_margins.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';
import '../../../styles/__export__.dart';
import '../../../view_model/__export__.dart';

class ShipmentHistoryItemCard extends HookConsumerWidget {
  const ShipmentHistoryItemCard({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final useShipmentViewModel = ref.watch(shipmentVMProvider);
    return Container(
      width: 1.sw,
      margin: EdgeInsets.only(bottom: 16.h),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: CustomColors.blackColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0,3)
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
              width: 114.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: CustomColors.offWhiteColor100,
                borderRadius: BorderRadius.circular(16.r)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  XMargin(8.w),
                    SvgPicture.asset("ic_refresh".svg),
                  XMargin(2.w),
                  Text(
                    useShipmentViewModel.selectedShipmentTab.tabName.toLowerCase()!="all"?useShipmentViewModel.selectedShipmentTab.tabName:'in-progress',
                    style: CustomStyle.textStyleInter.copyWith(
                      color: CustomColors.greenColor69,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      height: 15.73.toLineHeight(13.sp)
                    ),
                  )
                ],
              ),
            ),
          YMargin(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Arriving today!',
                      style: CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.blackColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        height: 21.78.toLineHeight(18.sp)
                      ),
                    ),
                    YMargin(8.h),
                    Text(
                      'Your delivery.\n#NEJ20089934122231 from Atlanta,\nis arriving today!',
                      style: CustomStyle.textStyleInter.copyWith(
                        color: CustomColors.gray500,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        height: 16.94.toLineHeight(14.sp)
                      ),
                    ),
                    YMargin(8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "\$1400 USD",
                          style: CustomStyle.textStyleInter.copyWith(
                              color: CustomColors.deepPurple,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              height: 16.94.toLineHeight(14.sp)
                          ),
                        ),
                        Container(
                          width: 6.w,
                          height: 6.h,
                          margin: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomColors.gray800
                          ),
                        ),
                        Text(
                          "Dec 4, 2023",
                          style: CustomStyle.textStyleInter.copyWith(
                              color: CustomColors.darkBlue100,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              height: 14.62.toLineHeight(12.sp)
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              XMargin(16.w),
              Expanded(child: SvgPicture.asset("ic_shipment_history_box".svg))
            ],
          )
        ],
      ),
    );
  }
}
