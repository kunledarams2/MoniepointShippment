import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moniepoin_shipment/presentation/custom_designs/custom_margins.dart';
import 'package:moniepoin_shipment/utils/extensions.dart';
import '../../../../utils/locator.dart';
import '../../../routes/__export__.dart';
import '../../../styles/__export__.dart';
import '../../../view_model/__export__.dart';
class CalculatorScreenHeader extends HookConsumerWidget {
  const CalculatorScreenHeader({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final useShipmentViewModel = ref.watch(shipmentVMProvider);
    return SafeArea(top: false,child:
    Container(
      width: 1.sw,
      height: 110.h,
      color: CustomColors.darkPurple,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YMargin(60.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XMargin(16.w),
              GestureDetector(
                onTap: (){
                 useShipmentViewModel.navigateBack();
                },
                  child: SvgPicture.asset("ic_arrow_left".svg)),
              Expanded(
                child: Text(
                  "Calculate",
                  textAlign: TextAlign.center,
                  style: CustomStyle.textStyleInter.copyWith(
                    color: CustomColors.whiteColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    height: 21.78.toLineHeight(18.sp),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),);
  }
}